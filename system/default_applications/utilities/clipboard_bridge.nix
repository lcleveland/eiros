# Bridges the Wayland clipboard into X11 CLIPBOARD and PRIMARY selections so
# XWayland apps (games, legacy X11 tools) can paste content copied in Wayland,
# and vice versa.
{ config, lib, pkgs, ... }:
let
  cfg = config.eiros.system.default_applications.utilities.clipboard_bridge;

  # programs.mango (MangoWC) has no systemd integration at the NixOS level —
  # that lives in the Home Manager module which is not used here. As a result,
  # graphical-session.target is never activated and services depending on it
  # never start. All daemons below use default.target instead and wait for
  # their required display sockets to appear before doing any work.

  # Wraps autocutsel to wait for an XWayland socket before starting.
  # 'selection' should be "CLIPBOARD" or "PRIMARY" (uppercase, passed directly
  # to autocutsel's -selection flag).
  autocutsel-wait = selection: pkgs.writeShellApplication {
    name = "autocutsel-${lib.toLower selection}";
    runtimeInputs = with pkgs; [ autocutsel findutils coreutils ];
    text = ''
      # Wait for any XWayland socket to appear
      until find /tmp/.X11-unix -maxdepth 1 -name 'X*' 2>/dev/null | grep -q .; do
        sleep 1
      done
      # Use the first available X11 display
      sock=$(find /tmp/.X11-unix -maxdepth 1 -name 'X*' 2>/dev/null | sort | head -1)
      export DISPLAY=":''${sock##*/X}"
      exec autocutsel -selection ${selection}
    '';
  };

  # Polls the Wayland clipboard every 100ms and writes any new text content
  # into X11 CLIPBOARD so XWayland apps can paste it. Waits for both the
  # Wayland compositor socket and an XWayland socket before starting the loop.
  wayland-to-x11-clipboard = pkgs.writeShellApplication {
    name = "wayland-to-x11-clipboard";
    runtimeInputs = with pkgs; [ wl-clipboard xclip findutils coreutils ];
    text = ''
      runtime_dir="''${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

      # Wait for Wayland compositor socket
      until find "$runtime_dir" -maxdepth 1 -name 'wayland-*' -type s 2>/dev/null | grep -q .; do
        sleep 1
      done
      sock=$(find "$runtime_dir" -maxdepth 1 -name 'wayland-*' -type s 2>/dev/null | sort | head -1)
      export WAYLAND_DISPLAY="''${sock##*/}"

      # Wait for XWayland socket
      until find /tmp/.X11-unix -maxdepth 1 -name 'X*' 2>/dev/null | grep -q .; do
        sleep 1
      done
      x11_sock=$(find /tmp/.X11-unix -maxdepth 1 -name 'X*' 2>/dev/null | sort | head -1)
      export DISPLAY=":''${x11_sock##*/X}"

      prev=""
      while true; do
        offered_types=$(wl-paste --list-types 2>/dev/null) || offered_types=""

        # Only read clipboard if a text MIME type is offered. Without this
        # check, wl-paste requests text/plain from sources that only offer
        # image/png; the source blindly sends binary data, bash strips null
        # bytes, and xclip re-advertises the corrupted bytes as text — causing
        # the Wayland compositor to bridge them back as text/plain;charset=utf-8
        # and DMS to store the binary image as a "Long Text" clipboard entry.
        if printf '%s\n' "$offered_types" | grep -iqE '^text/plain(;charset=.+)?$|^(UTF8_STRING|STRING|TEXT)$'; then
          # Explicitly request the matched text MIME type so wl-paste cannot
          # fall back to image/png when a source offers both text and image.
          # grep -im1 preserves the exact casing advertised by the source.
          req_type=$(printf '%s\n' "$offered_types" | grep -im1 '^text/plain') \
            || req_type=$(printf '%s\n' "$offered_types" | grep -Em1 '^(UTF8_STRING|STRING|TEXT)$') \
            || req_type=""
          current=$(wl-paste -n ''${req_type:+-t "$req_type"} 2>/dev/null) || true
          if [ -n "$current" ] && [ "$current" != "$prev" ]; then
            x11_current=$(xclip -selection clipboard -o 2>/dev/null) || true
            if [ "$current" != "$x11_current" ]; then
              printf '%s' "$current" | xclip -selection clipboard &
            fi
            prev="$current"
          fi
        fi
        sleep 0.1
      done
    '';
  };
in
{
  options.eiros.system.default_applications.utilities.clipboard_bridge = {
    enable = lib.mkOption {
      default = true;
      description = "Run clipboard bridge daemons to sync the Wayland clipboard with X11 CLIPBOARD and PRIMARY selections. Required for copy/paste between Wayland and XWayland apps (e.g. Proton games, legacy X11 tools). Also prevents binary image data (e.g. screenshots) from appearing as garbled text in clipboard history.";
      example = lib.literalExpression ''
        {
          eiros.system.default_applications.utilities.clipboard_bridge.enable = false;
        }
      '';
      type = lib.types.bool;
    };

    select_to_copy = lib.mkOption {
      default = false;
      description = "Sync X11 PRIMARY selection (highlighted text) into CLIPBOARD. Disable to prevent selected text from being automatically copied to clipboard while keeping all other clipboard services running.";
      example = lib.literalExpression ''
        {
          eiros.system.default_applications.utilities.clipboard_bridge.select_to_copy = false;
        }
      '';
      type = lib.types.bool;
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      systemd.user.services.autocutsel-primary = {
        description = "Sync X11 CLIPBOARD into PRIMARY selection";
        wantedBy = [ "default.target" ];
        serviceConfig = {
          ExecStart = "${autocutsel-wait "PRIMARY"}/bin/autocutsel-primary";
          Restart = "on-failure";
          RestartSec = 1;
        };
      };

      systemd.user.services.wayland-to-x11-clipboard = {
        description = "Poll Wayland clipboard and push text changes into X11 CLIPBOARD for XWayland apps";
        wantedBy = [ "default.target" ];
        serviceConfig = {
          ExecStart = "${wayland-to-x11-clipboard}/bin/wayland-to-x11-clipboard";
          Restart = "on-failure";
          RestartSec = 1;
        };
      };
    })

    (lib.mkIf (cfg.enable && cfg.select_to_copy) {
      systemd.user.services.autocutsel-clipboard = {
        description = "Sync X11 PRIMARY selection into CLIPBOARD";
        wantedBy = [ "default.target" ];
        serviceConfig = {
          ExecStart = "${autocutsel-wait "CLIPBOARD"}/bin/autocutsel-clipboard";
          Restart = "on-failure";
          RestartSec = 1;
        };
      };
    })
  ];
}
