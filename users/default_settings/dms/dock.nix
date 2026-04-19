# DMS application dock visibility, position, sizing, border, and launcher options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.dock = {

    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show the application dock.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.enable = true;
        }
      '';
    };

    auto_hide = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Auto-hide the dock when overlapped by windows.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.auto_hide = true;
        }
      '';
    };

    smart_auto_hide = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Smart auto-hide: only hide when a maximized window is present.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.smart_auto_hide = true;
        }
      '';
    };

    group_by_app = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Group multiple windows of the same app into one dock icon.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.group_by_app = true;
        }
      '';
    };

    restore_special_workspace_on_click = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Restore an app from a special workspace when clicking its dock icon.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.restore_special_workspace_on_click = true;
        }
      '';
    };

    open_on_overview = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show the dock when the overview/expo is open.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.open_on_overview = true;
        }
      '';
    };

    position = lib.mkOption {
      default = 1;
      type = lib.types.int;
      description = "Dock screen edge. 0 = Top, 1 = Bottom, 2 = Left, 3 = Right.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.position = 2;
        }
      '';
    };

    spacing = lib.mkOption {
      default = 4.0;
      type = lib.types.float;
      description = "Spacing between dock icons (pixels).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.spacing = 6.0;
        }
      '';
    };

    bottom_gap = lib.mkOption {
      default = 0.0;
      type = lib.types.float;
      description = "Gap between the dock and the screen edge (pixels).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.bottom_gap = 8.0;
        }
      '';
    };

    margin = lib.mkOption {
      default = 0.0;
      type = lib.types.float;
      description = "Outer margin around the dock (pixels).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.margin = 4.0;
        }
      '';
    };

    icon_size = lib.mkOption {
      default = 40.0;
      type = lib.types.float;
      description = "Dock icon size (pixels).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.icon_size = 48.0;
        }
      '';
    };

    indicator_style = lib.mkOption {
      default = "circle";
      type = lib.types.str;
      description = "Running app indicator style. Options: circle, bar, none.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.indicator_style = "bar";
        }
      '';
    };

    transparency = lib.mkOption {
      default = 1.0;
      type = lib.types.float;
      description = "Dock background transparency (0.0–1.0).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.transparency = 0.8;
        }
      '';
    };

    isolate_displays = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show only windows from the current display in the dock.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.isolate_displays = true;
        }
      '';
    };

    # ── Dock border ────────────────────────────────────────────────────────
    border = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show a border around the dock.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.dock.border.enable = true;
          }
        '';
      };

      color = lib.mkOption {
        default = "surfaceText";
        type = lib.types.str;
        description = "Dock border color token.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.dock.border.color = "primary";
          }
        '';
      };

      opacity = lib.mkOption {
        default = 1.0;
        type = lib.types.float;
        description = "Dock border opacity (0.0–1.0).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.dock.border.opacity = 0.5;
          }
        '';
      };

      thickness = lib.mkOption {
        default = 1;
        type = lib.types.int;
        description = "Dock border thickness (pixels).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.dock.border.thickness = 2;
          }
        '';
      };
    };

    # ── Dock launcher ──────────────────────────────────────────────────────
    launcher = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show a launcher button inside the dock.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.dock.launcher.enable = true;
          }
        '';
      };

      logo = {
        mode = lib.mkOption {
          default = "apps";
          type = lib.types.str;
          description = "Dock launcher logo mode. Options: apps, custom.";
          example = lib.literalExpression ''
            {
              eiros.system.user_defaults.dms.dock.launcher.logo.mode = "custom";
            }
          '';
        };

        custom_path = lib.mkOption {
          default = "";
          type = lib.types.str;
          description = "Path to custom dock launcher logo image.";
          example = lib.literalExpression ''
            {
              eiros.system.user_defaults.dms.dock.launcher.logo.custom_path = "/home/user/logo.svg";
            }
          '';
        };

        color_override = lib.mkOption {
          default = "";
          type = lib.types.str;
          description = "Color override for dock launcher logo (hex). Empty = theme color.";
          example = lib.literalExpression ''
            {
              eiros.system.user_defaults.dms.dock.launcher.logo.color_override = "#ffffff";
            }
          '';
        };

        size_offset = lib.mkOption {
          default = 0;
          type = lib.types.int;
          description = "Size offset for the dock launcher logo (pixels).";
          example = lib.literalExpression ''
            {
              eiros.system.user_defaults.dms.dock.launcher.logo.size_offset = 4;
            }
          '';
        };

        brightness = lib.mkOption {
          default = 0.5;
          type = lib.types.float;
          description = "Dock launcher logo brightness (0.0–1.0).";
          example = lib.literalExpression ''
            {
              eiros.system.user_defaults.dms.dock.launcher.logo.brightness = 0.8;
            }
          '';
        };

        contrast = lib.mkOption {
          default = 1.0;
          type = lib.types.float;
          description = "Dock launcher logo contrast multiplier.";
          example = lib.literalExpression ''
            {
              eiros.system.user_defaults.dms.dock.launcher.logo.contrast = 1.2;
            }
          '';
        };
      };
    };

    # ── App limits ─────────────────────────────────────────────────────────
    max_visible_apps = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Maximum pinned apps shown in the dock. 0 = unlimited.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.max_visible_apps = 10;
        }
      '';
    };

    max_visible_running_apps = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Maximum running apps shown in the dock. 0 = unlimited.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.max_visible_running_apps = 8;
        }
      '';
    };

    show_overflow_badge = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show an overflow badge when the dock app limit is exceeded.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.dock.show_overflow_badge = false;
        }
      '';
    };

  };
}
