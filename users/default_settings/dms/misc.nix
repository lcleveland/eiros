# DMS miscellaneous options: cursor settings, terminal multiplexer,
# launch prefix, system updater widget, clipboard, launcher plugins,
# and pinned devices.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms = {

    # ── Cursor ─────────────────────────────────────────────────────────────
    cursor_settings = lib.mkOption {
      default = {
        theme = "System Default";
        size = 24;
        niri = {
          hideWhenTyping = false;
          hideAfterInactiveMs = 0;
        };
        hyprland = {
          hideOnKeyPress = false;
          hideOnTouch = false;
          inactiveTimeout = 0;
        };
        dwl = {
          cursorHideTimeout = 0;
        };
      };
      type = lib.types.anything;
      description = "Cursor theme, size, and compositor-specific hide-on-inactivity settings.";
    };

    # ── Terminal multiplexer ───────────────────────────────────────────────
    mux_type = lib.mkOption {
      default = "tmux";
      type = lib.types.str;
      description = "Terminal multiplexer integration. Options: tmux, zellij.";
    };

    mux_use_custom_command = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Use a custom command to open the multiplexer instead of the built-in integration.";
    };

    mux_custom_command = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Custom shell command to open the terminal multiplexer.";
    };

    mux_session_filter = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Filter string applied to the multiplexer session list.";
    };

    # ── Launch prefix ──────────────────────────────────────────────────────
    launch_prefix = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Shell prefix prepended to all app launches (e.g. gamemoderun).";
    };

    # ── System updater widget ──────────────────────────────────────────────
    updater_hide_widget = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Hide the system updater widget from the control center.";
    };

    updater_use_custom_command = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Use a custom command for running system updates.";
    };

    updater_custom_command = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Custom shell command for system updates.";
    };

    updater_terminal_additional_params = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Extra parameters passed to the terminal when running updates.";
    };

    # ── Misc / clipboard / plugins ─────────────────────────────────────────
    built_in_plugin_settings = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Per-plugin settings for DMS built-in plugins.";
    };

    clipboard_enter_to_paste = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Press Enter to paste the selected clipboard history item.";
    };

    launcher_plugin_visibility = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Per-plugin visibility settings in the launcher (allowWithoutTrigger).";
    };

    launcher_plugin_order = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
      description = "Ordered list of launcher plugin IDs controlling display order.";
    };

    # ── Pinned devices ─────────────────────────────────────────────────────
    brightness_device_pins = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Pinned brightness devices shown at the top of the brightness list.";
    };

    wifi_network_pins = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Pinned WiFi networks shown at the top of the network list.";
    };

    bluetooth_device_pins = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Pinned Bluetooth devices shown at the top of the Bluetooth list.";
    };

    audio_input_device_pins = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Pinned audio input devices shown at the top of the input device list.";
    };

    audio_output_device_pins = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Pinned audio output devices shown at the top of the output device list.";
    };

  };
}
