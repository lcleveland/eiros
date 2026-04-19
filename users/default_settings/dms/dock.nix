# DMS application dock visibility, position, sizing, border, and launcher options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms = {

    # ── Dock ───────────────────────────────────────────────────────────────
    show_dock = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show the application dock.";
    };

    dock_auto_hide = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Auto-hide the dock when overlapped by windows.";
    };

    dock_smart_auto_hide = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Smart auto-hide: only hide when a maximized window is present.";
    };

    dock_group_by_app = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Group multiple windows of the same app into one dock icon.";
    };

    dock_restore_special_workspace_on_click = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Restore an app from a special workspace when clicking its dock icon.";
    };

    dock_open_on_overview = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show the dock when the overview/expo is open.";
    };

    dock_position = lib.mkOption {
      default = 1;
      type = lib.types.int;
      description = "Dock screen edge. 0 = Top, 1 = Bottom, 2 = Left, 3 = Right.";
    };

    dock_spacing = lib.mkOption {
      default = 4.0;
      type = lib.types.float;
      description = "Spacing between dock icons (pixels).";
    };

    dock_bottom_gap = lib.mkOption {
      default = 0.0;
      type = lib.types.float;
      description = "Gap between the dock and the screen edge (pixels).";
    };

    dock_margin = lib.mkOption {
      default = 0.0;
      type = lib.types.float;
      description = "Outer margin around the dock (pixels).";
    };

    dock_icon_size = lib.mkOption {
      default = 40.0;
      type = lib.types.float;
      description = "Dock icon size (pixels).";
    };

    dock_indicator_style = lib.mkOption {
      default = "circle";
      type = lib.types.str;
      description = "Running app indicator style. Options: circle, bar, none.";
    };

    dock_border_enabled = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show a border around the dock.";
    };

    dock_border_color = lib.mkOption {
      default = "surfaceText";
      type = lib.types.str;
      description = "Dock border color token.";
    };

    dock_border_opacity = lib.mkOption {
      default = 1.0;
      type = lib.types.float;
      description = "Dock border opacity (0.0–1.0).";
    };

    dock_border_thickness = lib.mkOption {
      default = 1;
      type = lib.types.int;
      description = "Dock border thickness (pixels).";
    };

    dock_isolate_displays = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show only windows from the current display in the dock.";
    };

    dock_launcher_enabled = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show a launcher button inside the dock.";
    };

    dock_launcher_logo_mode = lib.mkOption {
      default = "apps";
      type = lib.types.str;
      description = "Dock launcher logo mode. Options: apps, custom.";
    };

    dock_launcher_logo_custom_path = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Path to custom dock launcher logo image.";
    };

    dock_launcher_logo_color_override = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Color override for dock launcher logo (hex). Empty = theme color.";
    };

    dock_launcher_logo_size_offset = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Size offset for the dock launcher logo (pixels).";
    };

    dock_launcher_logo_brightness = lib.mkOption {
      default = 0.5;
      type = lib.types.float;
      description = "Dock launcher logo brightness (0.0–1.0).";
    };

    dock_launcher_logo_contrast = lib.mkOption {
      default = 1.0;
      type = lib.types.float;
      description = "Dock launcher logo contrast multiplier.";
    };

    dock_max_visible_apps = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Maximum pinned apps shown in the dock. 0 = unlimited.";
    };

    dock_max_visible_running_apps = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Maximum running apps shown in the dock. 0 = unlimited.";
    };

    dock_show_overflow_badge = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show an overflow badge when the dock app limit is exceeded.";
    };

  };
}
