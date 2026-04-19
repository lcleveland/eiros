# DMS multi-monitor display configuration: name mode, screen preferences,
# output settings, display profiles, and layout helpers.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.display = {

    name_mode = lib.mkOption {
      default = "system";
      type = lib.types.str;
      description = "How monitor names are displayed. Options: system, friendly.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.display.name_mode = "friendly";
        }
      '';
    };

    screen_preferences = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Per-screen display preferences keyed by monitor name.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.display.screen_preferences = {
            "HDMI-1" = { scale = 1.5; };
          };
        }
      '';
    };

    show_on_last_display = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Per-screen setting controlling whether widgets show on the last active display.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.display.show_on_last_display = {
            "eDP-1" = true;
          };
        }
      '';
    };

    niri_output_settings = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Niri-specific output configuration per monitor.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.display.niri_output_settings = {
            "HDMI-1" = { mode = "1920x1080@60"; };
          };
        }
      '';
    };

    hyprland_output_settings = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Hyprland-specific output configuration per monitor.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.display.hyprland_output_settings = {
            "HDMI-1" = { resolution = "1920x1080"; refreshRate = 60; };
          };
        }
      '';
    };

    profiles = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Named display configuration profiles.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.display.profiles = {
            "laptop-only" = { monitors = [ "eDP-1" ]; };
          };
        }
      '';
    };

    active_profile = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "The currently active display configuration profile.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.display.active_profile = { name = "laptop-only"; };
        }
      '';
    };

    profile_auto_select = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Automatically select the best matching display profile on monitor change.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.display.profile_auto_select = true;
        }
      '';
    };

    show_disconnected = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show disconnected monitors in the display settings panel.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.display.show_disconnected = true;
        }
      '';
    };

    snap_to_edge = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Snap monitors to edges when dragging in the display arrangement UI.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.display.snap_to_edge = false;
        }
      '';
    };

  };
}
