# DMS app launcher, spotlight search, and DankLauncher v2 options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.launcher = {

    # ── View modes ─────────────────────────────────────────────────────────
    view_mode = lib.mkOption {
      default = "list";
      type = lib.types.str;
      description = "App launcher default view mode. Options: list, grid.";
    };

    spotlight_view_mode = lib.mkOption {
      default = "list";
      type = lib.types.str;
      description = "Spotlight search default view mode. Options: list, grid.";
    };

    browser_picker_view_mode = lib.mkOption {
      default = "grid";
      type = lib.types.str;
      description = "Browser picker view mode. Options: list, grid.";
    };

    app_picker_view_mode = lib.mkOption {
      default = "grid";
      type = lib.types.str;
      description = "App picker view mode. Options: list, grid.";
    };

    browser_usage_history = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Browser usage history for frequency-based ordering.";
    };

    file_picker_usage_history = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "File picker usage history.";
    };

    # ── Launcher behavior ──────────────────────────────────────────────────
    sort_apps_alphabetically = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Sort apps alphabetically in the launcher instead of by frequency.";
    };

    grid_columns = lib.mkOption {
      default = 4;
      type = lib.types.int;
      description = "Number of columns in the app launcher grid view.";
    };

    spotlight_close_niri_overview = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Close the Niri overview when spotlight opens.";
    };

    remember_last_query = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Remember the last spotlight search query between opens.";
    };

    spotlight_section_view_modes = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Per-section view mode overrides for spotlight search results.";
    };

    drawer_section_view_modes = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Per-section view mode overrides for the app drawer.";
    };

    niri_overview_overlay.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the DMS overlay (bar, dock) when the Niri overview is open.";
    };

    # ── DankLauncher v2 ────────────────────────────────────────────────────
    v2 = {
      size = lib.mkOption {
        default = "compact";
        type = lib.types.str;
        description = "DankLauncher v2 window size. Options: compact, normal, large.";
      };

      border = {
        enable = lib.mkOption {
          default = false;
          type = lib.types.bool;
          description = "Show a border around DankLauncher v2.";
        };

        thickness = lib.mkOption {
          default = 2;
          type = lib.types.int;
          description = "DankLauncher v2 border thickness (pixels).";
        };

        color = lib.mkOption {
          default = "primary";
          type = lib.types.str;
          description = "DankLauncher v2 border color token.";
        };
      };

      show_footer = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show the footer bar in DankLauncher v2.";
      };

      unload_on_close = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Unload DankLauncher v2 from memory when it is closed.";
      };

      include_files_in_all = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Include file results in the \"All\" search section.";
      };

      include_folders_in_all = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Include folder results in the \"All\" search section.";
      };
    };

    # ── Launcher logo ──────────────────────────────────────────────────────
    logo = {
      mode = lib.mkOption {
        default = "apps";
        type = lib.types.str;
        description = "Launcher button logo style. Options: apps, custom.";
      };

      custom_path = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Path to a custom launcher button logo image.";
      };

      color_override = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Color override for the launcher logo (hex). Empty = theme color.";
      };

      color_invert_on_mode = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Invert the launcher logo color in light mode.";
      };

      brightness = lib.mkOption {
        default = 0.5;
        type = lib.types.float;
        description = "Launcher logo brightness (0.0–1.0).";
      };

      contrast = lib.mkOption {
        default = 1;
        type = lib.types.int;
        description = "Launcher logo contrast multiplier.";
      };

      size_offset = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Launcher logo size offset (pixels).";
      };
    };

  };
}
