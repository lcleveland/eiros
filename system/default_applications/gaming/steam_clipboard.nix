# Syncs X11 PRIMARY and CLIPBOARD selections for live copy/paste between XWayland apps (Steam/Proton games) and Wayland.
{ config, lib, pkgs, ... }:
let
  eiros_steam_clipboard = config.eiros.system.default_applications.gaming.steam_clipboard;
in
{
  options.eiros.system.default_applications.gaming.steam_clipboard.enable = lib.mkOption {
    default = true;
    description = "Bridge clipboard between Wayland and X11 (XWayland) for live copy/paste to and from Proton games. Runs autocutsel to sync X11 PRIMARY↔CLIPBOARD and a wl-paste watcher to push Wayland clipboard changes into X11. When Steam is enabled, also injects wl-clipboard-x11 and xdotool into its FHS container.";
    example = lib.literalExpression ''
      {
        eiros.system.default_applications.gaming.steam_clipboard.enable = false;
      }
    '';
    type = lib.types.bool;
  };

  config = lib.mkMerge [
    (lib.mkIf eiros_steam_clipboard.enable {
      systemd.user.services.autocutsel-clipboard = {
        description = "Sync X11 PRIMARY selection into CLIPBOARD";
        wantedBy = [ "graphical-session.target" ];
        partOf = [ "graphical-session.target" ];
        serviceConfig = {
          ExecStart = "${pkgs.autocutsel}/bin/autocutsel -selection CLIPBOARD";
          Restart = "on-failure";
          RestartSec = 1;
        };
      };

      systemd.user.services.autocutsel-primary = {
        description = "Sync X11 CLIPBOARD into PRIMARY selection";
        wantedBy = [ "graphical-session.target" ];
        partOf = [ "graphical-session.target" ];
        serviceConfig = {
          ExecStart = "${pkgs.autocutsel}/bin/autocutsel -selection PRIMARY";
          Restart = "on-failure";
          RestartSec = 1;
        };
      };

      # The compositor does not automatically push Wayland clipboard changes into
      # XWayland's X11 clipboard. This service watches for Wayland clipboard changes
      # and writes them into X11 CLIPBOARD so XWayland apps (games) can paste.
      systemd.user.services.wayland-to-x11-clipboard = {
        description = "Push Wayland clipboard changes into X11 CLIPBOARD for XWayland apps";
        wantedBy = [ "graphical-session.target" ];
        partOf = [ "graphical-session.target" ];
        serviceConfig = {
          ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.xclip}/bin/xclip -selection clipboard -i";
          Restart = "on-failure";
          RestartSec = 1;
        };
      };
    })

    (lib.mkIf (eiros_steam_clipboard.enable && config.programs.steam.enable) {
      programs.steam.extraPackages = with pkgs; [
        wl-clipboard-x11
        xdotool
      ];
    })
  ];
}
