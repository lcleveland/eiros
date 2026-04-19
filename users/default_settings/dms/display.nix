# DMS multi-monitor display configuration: name mode, screen preferences,
# output settings, display profiles, and layout helpers.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.display = {

    name_mode = lib.mkOption {
      default = "system";
      type = lib.types.str;
      description = "How monitor names are displayed. Options: system, friendly.";
    };

    screen_preferences = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Per-screen display preferences keyed by monitor name.";
    };

    show_on_last_display = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Per-screen setting controlling whether widgets show on the last active display.";
    };

    niri_output_settings = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Niri-specific output configuration per monitor.";
    };

    hyprland_output_settings = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Hyprland-specific output configuration per monitor.";
    };

    profiles = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Named display configuration profiles.";
    };

    active_profile = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "The currently active display configuration profile.";
    };

    profile_auto_select = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Automatically select the best matching display profile on monitor change.";
    };

    show_disconnected = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show disconnected monitors in the display settings panel.";
    };

    snap_to_edge = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Snap monitors to edges when dragging in the display arrangement UI.";
    };

  };
}
