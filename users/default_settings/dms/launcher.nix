# DMS app launcher, spotlight search, and DankLauncher v2 options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.launcher = {

    # ── View modes ─────────────────────────────────────────────────────────
    view_mode = lib.mkOption {
      default = "list";
      type = lib.types.str;
      description = "App launcher default view mode. Options: list, grid.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.launcher.view_mode = "grid";
        }
      '';
    };

    spotlight_view_mode = lib.mkOption {
      default = "list";
      type = lib.types.str;
      description = "Spotlight search default view mode. Options: list, grid.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.launcher.spotlight_view_mode = "grid";
        }
      '';
    };

    browser_picker_view_mode = lib.mkOption {
      default = "grid";
      type = lib.types.str;
      description = "Browser picker view mode. Options: list, grid.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.launcher.browser_picker_view_mode = "list";
        }
      '';
    };

    app_picker_view_mode = lib.mkOption {
      default = "grid";
      type = lib.types.str;
      description = "App picker view mode. Options: list, grid.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.launcher.app_picker_view_mode = "list";
        }
      '';
    };

    browser_usage_history = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Browser usage history for frequency-based ordering.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.launcher.browser_usage_history = {
            "firefox" = { count = 42; };
          };
        }
      '';
    };

    file_picker_usage_history = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "File picker usage history.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.launcher.file_picker_usage_history = {
            "/home/user/Documents" = { count = 10; };
          };
        }
      '';
    };

    # ── Launcher behavior ──────────────────────────────────────────────────
    sort_apps_alphabetically = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Sort apps alphabetically in the launcher instead of by frequency.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.launcher.sort_apps_alphabetically = true;
        }
      '';
    };

    grid_columns = lib.mkOption {
      default = 4;
      type = lib.types.int;
      description = "Number of columns in the app launcher grid view.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.launcher.grid_columns = 6;
        }
      '';
    };

    spotlight_close_niri_overview = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Close the Niri overview when spotlight opens.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.launcher.spotlight_close_niri_overview = false;
        }
      '';
    };

    remember_last_query = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Remember the last spotlight search query between opens.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.launcher.remember_last_query = true;
        }
      '';
    };

    spotlight_section_view_modes = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Per-section view mode overrides for spotlight search results.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.launcher.spotlight_section_view_modes = {
            "apps" = "grid";
          };
        }
      '';
    };

    drawer_section_view_modes = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Per-section view mode overrides for the app drawer.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.launcher.drawer_section_view_modes = {
            "recent" = "list";
          };
        }
      '';
    };

    niri_overview_overlay.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the DMS overlay (bar, dock) when the Niri overview is open.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.launcher.niri_overview_overlay.enable = false;
        }
      '';
    };

    # ── DankLauncher v2 ────────────────────────────────────────────────────
    v2 = {
      size = lib.mkOption {
        default = "compact";
        type = lib.types.str;
        description = "DankLauncher v2 window size. Options: compact, normal, large.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.launcher.v2.size = "normal";
          }
        '';
      };

      border = {
        enable = lib.mkOption {
          default = false;
          type = lib.types.bool;
          description = "Show a border around DankLauncher v2.";
          example = lib.literalExpression ''
            {
              eiros.system.user_defaults.dms.launcher.v2.border.enable = true;
            }
          '';
        };

        thickness = lib.mkOption {
          default = 2;
          type = lib.types.int;
          description = "DankLauncher v2 border thickness (pixels).";
          example = lib.literalExpression ''
            {
              eiros.system.user_defaults.dms.launcher.v2.border.thickness = 1;
            }
          '';
        };

        color = lib.mkOption {
          default = "primary";
          type = lib.types.str;
          description = "DankLauncher v2 border color token.";
          example = lib.literalExpression ''
            {
              eiros.system.user_defaults.dms.launcher.v2.border.color = "secondary";
            }
          '';
        };
      };

      show_footer = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show the footer bar in DankLauncher v2.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.launcher.v2.show_footer = false;
          }
        '';
      };

      unload_on_close = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Unload DankLauncher v2 from memory when it is closed.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.launcher.v2.unload_on_close = true;
          }
        '';
      };

      include_files_in_all = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Include file results in the \"All\" search section.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.launcher.v2.include_files_in_all = true;
          }
        '';
      };

      include_folders_in_all = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Include folder results in the \"All\" search section.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.launcher.v2.include_folders_in_all = true;
          }
        '';
      };
    };

    # ── Launcher logo ──────────────────────────────────────────────────────
    logo = {
      mode = lib.mkOption {
        default = "apps";
        type = lib.types.str;
        description = "Launcher button logo style. Options: apps, custom.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.launcher.logo.mode = "custom";
          }
        '';
      };

      custom_path = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Path to a custom launcher button logo image.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.launcher.logo.custom_path = "/home/user/logo.svg";
          }
        '';
      };

      color_override = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Color override for the launcher logo (hex). Empty = theme color.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.launcher.logo.color_override = "#ffffff";
          }
        '';
      };

      color_invert_on_mode = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Invert the launcher logo color in light mode.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.launcher.logo.color_invert_on_mode = true;
          }
        '';
      };

      brightness = lib.mkOption {
        default = 0.5;
        type = lib.types.float;
        description = "Launcher logo brightness (0.0–1.0).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.launcher.logo.brightness = 0.8;
          }
        '';
      };

      contrast = lib.mkOption {
        default = 1;
        type = lib.types.int;
        description = "Launcher logo contrast multiplier.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.launcher.logo.contrast = 2;
          }
        '';
      };

      size_offset = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Launcher logo size offset (pixels).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.launcher.logo.size_offset = 4;
          }
        '';
      };
    };

  };
}
