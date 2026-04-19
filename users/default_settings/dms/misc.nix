# DMS miscellaneous options: cursor settings, terminal multiplexer,
# launch prefix, system updater widget, clipboard, launcher plugins,
# and pinned devices.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.misc = {

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
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.misc.cursor_settings = {
            theme = "Bibata-Modern-Classic";
            size = 32;
            niri = { hideWhenTyping = true; hideAfterInactiveMs = 3000; };
            hyprland = { hideOnKeyPress = true; hideOnTouch = false; inactiveTimeout = 5; };
            dwl = { cursorHideTimeout = 5000; };
          };
        }
      '';
    };

    # ── Terminal multiplexer ───────────────────────────────────────────────
    mux = {
      type = lib.mkOption {
        default = "tmux";
        type = lib.types.str;
        description = "Terminal multiplexer integration. Options: tmux, zellij.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.misc.mux.type = "zellij";
          }
        '';
      };

      use_custom_command = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Use a custom command to open the multiplexer instead of the built-in integration.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.misc.mux.use_custom_command = true;
          }
        '';
      };

      custom_command = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command to open the terminal multiplexer.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.misc.mux.custom_command = "tmux new-session -A -s main";
          }
        '';
      };

      session_filter = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Filter string applied to the multiplexer session list.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.misc.mux.session_filter = "work";
          }
        '';
      };
    };

    # ── Launch prefix ──────────────────────────────────────────────────────
    launch_prefix = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Shell prefix prepended to all app launches (e.g. gamemoderun).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.misc.launch_prefix = "gamemoderun";
        }
      '';
    };

    # ── System updater widget ──────────────────────────────────────────────
    updater = {
      hide_widget = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Hide the system updater widget from the control center.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.misc.updater.hide_widget = true;
          }
        '';
      };

      use_custom_command = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Use a custom command for running system updates.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.misc.updater.use_custom_command = true;
          }
        '';
      };

      custom_command = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command for system updates.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.misc.updater.custom_command = "nixos-rebuild switch";
          }
        '';
      };

      terminal_additional_params = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Extra parameters passed to the terminal when running updates.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.misc.updater.terminal_additional_params = "--hold";
          }
        '';
      };
    };

    # ── Misc / clipboard / plugins ─────────────────────────────────────────
    built_in_plugin_settings = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Per-plugin settings for DMS built-in plugins.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.misc.built_in_plugin_settings = {
            "my-plugin" = { theme = "dark"; };
          };
        }
      '';
    };

    external_plugin_settings = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Per-external-plugin settings written to ~/.config/DankMaterialShell/plugin_settings.json. Controls enabled state and other plugin-specific configuration.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.misc.external_plugin_settings = {
            "my-external-plugin" = { enabled = true; };
          };
        }
      '';
    };

    clipboard_enter_to_paste = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Press Enter to paste the selected clipboard history item.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.misc.clipboard_enter_to_paste = true;
        }
      '';
    };

    launcher_plugin_visibility = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Per-plugin visibility settings in the launcher (allowWithoutTrigger).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.misc.launcher_plugin_visibility = {
            "calculator" = { allowWithoutTrigger = true; };
          };
        }
      '';
    };

    launcher_plugin_order = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
      description = "Ordered list of launcher plugin IDs controlling display order.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.misc.launcher_plugin_order = [ "apps" "calculator" "files" ];
        }
      '';
    };

    # ── Pinned devices ─────────────────────────────────────────────────────
    brightness_device_pins = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Pinned brightness devices shown at the top of the brightness list.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.misc.brightness_device_pins = {
            "intel_backlight" = true;
          };
        }
      '';
    };

    wifi_network_pins = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Pinned WiFi networks shown at the top of the network list.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.misc.wifi_network_pins = {
            "MyHomeNetwork" = true;
          };
        }
      '';
    };

    bluetooth_device_pins = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Pinned Bluetooth devices shown at the top of the Bluetooth list.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.misc.bluetooth_device_pins = {
            "MyHeadphones" = true;
          };
        }
      '';
    };

    audio_input_device_pins = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Pinned audio input devices shown at the top of the input device list.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.misc.audio_input_device_pins = {
            "USB Microphone" = true;
          };
        }
      '';
    };

    audio_output_device_pins = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Pinned audio output devices shown at the top of the output device list.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.misc.audio_output_device_pins = {
            "WH-1000XM5" = true;
          };
        }
      '';
    };

  };
}
