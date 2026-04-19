# DMS application dock visibility, position, sizing, border, and launcher options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.dock = {

    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show the application dock.";
    };

    auto_hide = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Auto-hide the dock when overlapped by windows.";
    };

    smart_auto_hide = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Smart auto-hide: only hide when a maximized window is present.";
    };

    group_by_app = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Group multiple windows of the same app into one dock icon.";
    };

    restore_special_workspace_on_click = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Restore an app from a special workspace when clicking its dock icon.";
    };

    open_on_overview = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show the dock when the overview/expo is open.";
    };

    position = lib.mkOption {
      default = 1;
      type = lib.types.int;
      description = "Dock screen edge. 0 = Top, 1 = Bottom, 2 = Left, 3 = Right.";
    };

    spacing = lib.mkOption {
      default = 4.0;
      type = lib.types.float;
      description = "Spacing between dock icons (pixels).";
    };

    bottom_gap = lib.mkOption {
      default = 0.0;
      type = lib.types.float;
      description = "Gap between the dock and the screen edge (pixels).";
    };

    margin = lib.mkOption {
      default = 0.0;
      type = lib.types.float;
      description = "Outer margin around the dock (pixels).";
    };

    icon_size = lib.mkOption {
      default = 40.0;
      type = lib.types.float;
      description = "Dock icon size (pixels).";
    };

    indicator_style = lib.mkOption {
      default = "circle";
      type = lib.types.str;
      description = "Running app indicator style. Options: circle, bar, none.";
    };

    transparency = lib.mkOption {
      default = 1.0;
      type = lib.types.float;
      description = "Dock background transparency (0.0–1.0).";
    };

    isolate_displays = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show only windows from the current display in the dock.";
    };

    # ── Dock border ────────────────────────────────────────────────────────
    border = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show a border around the dock.";
      };

      color = lib.mkOption {
        default = "surfaceText";
        type = lib.types.str;
        description = "Dock border color token.";
      };

      opacity = lib.mkOption {
        default = 1.0;
        type = lib.types.float;
        description = "Dock border opacity (0.0–1.0).";
      };

      thickness = lib.mkOption {
        default = 1;
        type = lib.types.int;
        description = "Dock border thickness (pixels).";
      };
    };

    # ── Dock launcher ──────────────────────────────────────────────────────
    launcher = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show a launcher button inside the dock.";
      };

      logo = {
        mode = lib.mkOption {
          default = "apps";
          type = lib.types.str;
          description = "Dock launcher logo mode. Options: apps, custom.";
        };

        custom_path = lib.mkOption {
          default = "";
          type = lib.types.str;
          description = "Path to custom dock launcher logo image.";
        };

        color_override = lib.mkOption {
          default = "";
          type = lib.types.str;
          description = "Color override for dock launcher logo (hex). Empty = theme color.";
        };

        size_offset = lib.mkOption {
          default = 0;
          type = lib.types.int;
          description = "Size offset for the dock launcher logo (pixels).";
        };

        brightness = lib.mkOption {
          default = 0.5;
          type = lib.types.float;
          description = "Dock launcher logo brightness (0.0–1.0).";
        };

        contrast = lib.mkOption {
          default = 1.0;
          type = lib.types.float;
          description = "Dock launcher logo contrast multiplier.";
        };
      };
    };

    # ── App limits ─────────────────────────────────────────────────────────
    max_visible_apps = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Maximum pinned apps shown in the dock. 0 = unlimited.";
    };

    max_visible_running_apps = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Maximum running apps shown in the dock. 0 = unlimited.";
    };

    show_overflow_badge = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show an overflow badge when the dock app limit is exceeded.";
    };

  };
}
