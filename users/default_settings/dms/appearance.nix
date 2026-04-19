# DMS visual appearance: transparency, color modes, corner radius, compositor layout
# overrides, animations, elevation shadows, and blur.
{ lib, ... }:
let
  mkAnimSpeedOption = default: desc: lib.mkOption {
    inherit default;
    type = lib.types.int;
    description = desc + " 0=None, 1=Short, 2=Medium, 3=Long, 4=Custom.";
  };
  mkAnimDurationOption = default: desc: lib.mkOption {
    inherit default;
    type = lib.types.int;
    description = desc + " Used when the paired speed option = 4.";
  };
  mkLayoutOverride = desc: lib.mkOption {
    default = -1;
    type = lib.types.int;
    description = desc + " -1 = use compositor default.";
  };
in
{
  options.eiros.system.user_defaults.dms.appearance = {

    # ── General ────────────────────────────────────────────────────────────
    popup_transparency = lib.mkOption {
      default = 1.0;
      type = lib.types.float;
      description = "Popup and panel background transparency (0.0 = fully transparent, 1.0 = opaque).";
    };

    widget_background_color = lib.mkOption {
      default = "sch";
      type = lib.types.str;
      description = "Widget background color token. 'sch' follows the active color scheme.";
    };

    widget_color_mode = lib.mkOption {
      default = "default";
      type = lib.types.str;
      description = "Widget color mode. Options: default, colorful.";
    };

    button_color_mode = lib.mkOption {
      default = "primary";
      type = lib.types.str;
      description = "Button accent color mode.";
    };

    corner_radius = lib.mkOption {
      default = 16;
      type = lib.types.int;
      description = "Global corner radius in pixels for widgets, popups, and panels.";
    };

    # ── Compositor layout overrides ────────────────────────────────────────
    niri_layout_gaps_override = mkLayoutOverride "Override Niri window gaps (px).";
    niri_layout_radius_override = mkLayoutOverride "Override Niri window corner radius.";
    niri_layout_border_size = mkLayoutOverride "Override Niri window border size (px).";

    hyprland_layout_gaps_override = mkLayoutOverride "Override Hyprland window gaps.";
    hyprland_layout_radius_override = mkLayoutOverride "Override Hyprland window corner radius.";
    hyprland_layout_border_size = mkLayoutOverride "Override Hyprland window border size.";

    mango_layout_gaps_override = mkLayoutOverride "Override MangoWC window gaps (px).";
    mango_layout_radius_override = mkLayoutOverride "Override MangoWC window corner radius.";
    mango_layout_border_size = mkLayoutOverride "Override MangoWC window border size (px).";

    # ── Animations ─────────────────────────────────────────────────────────
    animation_speed = mkAnimSpeedOption 1 "Global animation speed preset.";
    custom_animation_duration = mkAnimDurationOption 500 "Custom global animation duration in milliseconds.";

    sync_component_animation_speeds = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Sync popout and modal animation speeds with the global animationSpeed.";
    };

    popout_animation_speed = mkAnimSpeedOption 1 "Popout widget animation speed.";
    popout_custom_animation_duration = mkAnimDurationOption 150 "Custom popout animation duration in milliseconds.";

    modal_animation_speed = mkAnimSpeedOption 1 "Modal dialog animation speed.";
    modal_custom_animation_duration = mkAnimDurationOption 150 "Custom modal animation duration in milliseconds.";

    ripple_effects.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enable Material 3 ripple click effects on interactive elements.";
    };

    # ── Elevation (shadows) ────────────────────────────────────────────────
    m3_elevation = {
      enable = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Enable Material 3 elevation shadows on widgets.";
      };

      intensity = lib.mkOption {
        default = 12;
        type = lib.types.int;
        description = "Elevation shadow spread intensity (0–100).";
      };

      opacity = lib.mkOption {
        default = 30;
        type = lib.types.int;
        description = "Elevation shadow opacity (0–100).";
      };

      color_mode = lib.mkOption {
        default = "default";
        type = lib.types.str;
        description = "Elevation shadow color mode. Options: default, custom.";
      };

      light_direction = lib.mkOption {
        default = "top";
        type = lib.types.str;
        description = "Simulated light direction for elevation shadows. Options: top, bottom, left, right.";
      };

      custom_color = lib.mkOption {
        default = "#000000";
        type = lib.types.str;
        description = "Custom elevation shadow color (hex). Used when color_mode = \"custom\".";
      };
    };

    modal_elevation.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Apply elevation shadows to modal dialogs.";
    };

    popout_elevation.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Apply elevation shadows to popout widgets.";
    };

    bar_elevation.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Apply elevation shadow to the bar.";
    };

    # ── Blur ───────────────────────────────────────────────────────────────
    blur = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Enable background blur on widgets and panels (requires compositor blur support).";
      };

      border_color = lib.mkOption {
        default = "outline";
        type = lib.types.str;
        description = "Color token for the blur border.";
      };

      border_custom_color = lib.mkOption {
        default = "#ffffff";
        type = lib.types.str;
        description = "Custom blur border color (hex).";
      };

      border_opacity = lib.mkOption {
        default = 1.0;
        type = lib.types.float;
        description = "Blur border opacity (0.0–1.0).";
      };
    };

    wallpaper_fill_mode = lib.mkOption {
      default = "Fill";
      type = lib.types.str;
      description = "Wallpaper fill mode. Options: Fill, Fit, Stretch, Crop, Tile.";
    };

    blurred_wallpaper_layer = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Render a blurred wallpaper layer behind transparent panels.";
    };

    blur_wallpaper_on_overview = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Blur the wallpaper when the overview/expo is open.";
    };

  };
}
