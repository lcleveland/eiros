# DMS visual appearance: transparency, color modes, corner radius, compositor layout
# overrides, animations, elevation shadows, and blur.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.appearance = {

    # ── General ────────────────────────────────────────────────────────────
    popup_transparency = lib.mkOption {
      default = 1.0;
      type = lib.types.float;
      description = "Popup and panel background transparency (0.0 = fully transparent, 1.0 = opaque).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.popup_transparency = 0.8;
        }
      '';
    };

    widget_background_color = lib.mkOption {
      default = "sch";
      type = lib.types.str;
      description = "Widget background color token. 'sch' follows the active color scheme.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.widget_background_color = "primary";
        }
      '';
    };

    widget_color_mode = lib.mkOption {
      default = "default";
      type = lib.types.str;
      description = "Widget color mode. Options: default, colorful.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.widget_color_mode = "colorful";
        }
      '';
    };

    button_color_mode = lib.mkOption {
      default = "primary";
      type = lib.types.str;
      description = "Button accent color mode.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.button_color_mode = "secondary";
        }
      '';
    };

    corner_radius = lib.mkOption {
      default = 16;
      type = lib.types.int;
      description = "Global corner radius in pixels for widgets, popups, and panels.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.corner_radius = 8;
        }
      '';
    };

    # ── Compositor layout overrides ────────────────────────────────────────
    niri_layout_gaps_override = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override Niri window gaps (px). -1 = use compositor default.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.niri_layout_gaps_override = 8;
        }
      '';
    };

    niri_layout_radius_override = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override Niri window corner radius. -1 = use compositor default.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.niri_layout_radius_override = 12;
        }
      '';
    };

    niri_layout_border_size = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override Niri window border size (px). -1 = use compositor default.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.niri_layout_border_size = 2;
        }
      '';
    };

    hyprland_layout_gaps_override = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override Hyprland window gaps. -1 = use compositor default.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.hyprland_layout_gaps_override = 8;
        }
      '';
    };

    hyprland_layout_radius_override = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override Hyprland window corner radius. -1 = use compositor default.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.hyprland_layout_radius_override = 12;
        }
      '';
    };

    hyprland_layout_border_size = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override Hyprland window border size. -1 = use compositor default.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.hyprland_layout_border_size = 2;
        }
      '';
    };

    mango_layout_gaps_override = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override MangoWC window gaps (px). -1 = use compositor default.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.mango_layout_gaps_override = 8;
        }
      '';
    };

    mango_layout_radius_override = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override MangoWC window corner radius. -1 = use compositor default.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.mango_layout_radius_override = 12;
        }
      '';
    };

    mango_layout_border_size = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override MangoWC window border size (px). -1 = use compositor default.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.mango_layout_border_size = 2;
        }
      '';
    };

    # ── Animations ─────────────────────────────────────────────────────────
    animation_speed = lib.mkOption {
      default = 1;
      type = lib.types.int;
      description = "Global animation speed preset. 0=None, 1=Short, 2=Medium, 3=Long, 4=Custom.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.animation_speed = 2;
        }
      '';
    };

    custom_animation_duration = lib.mkOption {
      default = 500;
      type = lib.types.int;
      description = "Custom global animation duration in milliseconds. Used when the paired speed option = 4.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.custom_animation_duration = 300;
        }
      '';
    };

    sync_component_animation_speeds = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Sync popout and modal animation speeds with the global animationSpeed.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.sync_component_animation_speeds = false;
        }
      '';
    };

    popout_animation_speed = lib.mkOption {
      default = 1;
      type = lib.types.int;
      description = "Popout widget animation speed. 0=None, 1=Short, 2=Medium, 3=Long, 4=Custom.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.popout_animation_speed = 2;
        }
      '';
    };

    popout_custom_animation_duration = lib.mkOption {
      default = 150;
      type = lib.types.int;
      description = "Custom popout animation duration in milliseconds. Used when the paired speed option = 4.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.popout_custom_animation_duration = 250;
        }
      '';
    };

    modal_animation_speed = lib.mkOption {
      default = 1;
      type = lib.types.int;
      description = "Modal dialog animation speed. 0=None, 1=Short, 2=Medium, 3=Long, 4=Custom.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.modal_animation_speed = 2;
        }
      '';
    };

    modal_custom_animation_duration = lib.mkOption {
      default = 150;
      type = lib.types.int;
      description = "Custom modal animation duration in milliseconds. Used when the paired speed option = 4.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.modal_custom_animation_duration = 250;
        }
      '';
    };

    ripple_effects.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enable Material 3 ripple click effects on interactive elements.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.ripple_effects.enable = false;
        }
      '';
    };

    # ── Elevation (shadows) ────────────────────────────────────────────────
    m3_elevation = {
      enable = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Enable Material 3 elevation shadows on widgets.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.appearance.m3_elevation.enable = false;
          }
        '';
      };

      intensity = lib.mkOption {
        default = 12;
        type = lib.types.int;
        description = "Elevation shadow spread intensity (0–100).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.appearance.m3_elevation.intensity = 20;
          }
        '';
      };

      opacity = lib.mkOption {
        default = 30;
        type = lib.types.int;
        description = "Elevation shadow opacity (0–100).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.appearance.m3_elevation.opacity = 50;
          }
        '';
      };

      color_mode = lib.mkOption {
        default = "default";
        type = lib.types.str;
        description = "Elevation shadow color mode. Options: default, custom.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.appearance.m3_elevation.color_mode = "custom";
          }
        '';
      };

      light_direction = lib.mkOption {
        default = "top";
        type = lib.types.str;
        description = "Simulated light direction for elevation shadows. Options: top, bottom, left, right.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.appearance.m3_elevation.light_direction = "bottom";
          }
        '';
      };

      custom_color = lib.mkOption {
        default = "#000000";
        type = lib.types.str;
        description = "Custom elevation shadow color (hex). Used when color_mode = \"custom\".";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.appearance.m3_elevation.custom_color = "#1a1a2e";
          }
        '';
      };
    };

    modal_elevation.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Apply elevation shadows to modal dialogs.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.modal_elevation.enable = false;
        }
      '';
    };

    popout_elevation.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Apply elevation shadows to popout widgets.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.popout_elevation.enable = false;
        }
      '';
    };

    bar_elevation.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Apply elevation shadow to the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.bar_elevation.enable = false;
        }
      '';
    };

    # ── Blur ───────────────────────────────────────────────────────────────
    blur = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Enable background blur on widgets and panels (requires compositor blur support).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.appearance.blur.enable = true;
          }
        '';
      };

      border_color = lib.mkOption {
        default = "outline";
        type = lib.types.str;
        description = "Color token for the blur border.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.appearance.blur.border_color = "primary";
          }
        '';
      };

      border_custom_color = lib.mkOption {
        default = "#ffffff";
        type = lib.types.str;
        description = "Custom blur border color (hex).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.appearance.blur.border_custom_color = "#1a1a2e";
          }
        '';
      };

      border_opacity = lib.mkOption {
        default = 1.0;
        type = lib.types.float;
        description = "Blur border opacity (0.0–1.0).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.appearance.blur.border_opacity = 0.7;
          }
        '';
      };
    };

    wallpaper_fill_mode = lib.mkOption {
      default = "Fill";
      type = lib.types.str;
      description = "Wallpaper fill mode. Options: Fill, Fit, Stretch, Crop, Tile.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.wallpaper_fill_mode = "Fit";
        }
      '';
    };

    blurred_wallpaper_layer = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Render a blurred wallpaper layer behind transparent panels.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.blurred_wallpaper_layer = true;
        }
      '';
    };

    blur_wallpaper_on_overview = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Blur the wallpaper when the overview/expo is open.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.appearance.blur_wallpaper_on_overview = true;
        }
      '';
    };

  };
}
