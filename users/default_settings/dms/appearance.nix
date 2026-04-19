# DMS visual appearance: transparency, color modes, corner radius, compositor layout
# overrides, animations, elevation shadows, and blur.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms = {

    # ── Appearance ─────────────────────────────────────────────────────────
    popup_transparency = lib.mkOption {
      default = 1.0;
      type = lib.types.float;
      description = "Popup and panel background transparency (0.0 = fully transparent, 1.0 = opaque).";
    };

    dock_transparency = lib.mkOption {
      default = 1.0;
      type = lib.types.float;
      description = "Dock background transparency (0.0–1.0).";
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

    control_center_tile_color_mode = lib.mkOption {
      default = "primary";
      type = lib.types.str;
      description = "Active tile color mode in the control center.";
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
    niri_layout_gaps_override = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override Niri window gaps (px). -1 = use compositor default.";
    };

    niri_layout_radius_override = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override Niri window corner radius. -1 = use compositor default.";
    };

    niri_layout_border_size = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override Niri window border size (px). -1 = use compositor default.";
    };

    hyprland_layout_gaps_override = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override Hyprland window gaps. -1 = use compositor default.";
    };

    hyprland_layout_radius_override = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override Hyprland window corner radius. -1 = use compositor default.";
    };

    hyprland_layout_border_size = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override Hyprland window border size. -1 = use compositor default.";
    };

    mango_layout_gaps_override = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override MangoWC window gaps (px). -1 = use compositor default.";
    };

    mango_layout_radius_override = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override MangoWC window corner radius. -1 = use compositor default.";
    };

    mango_layout_border_size = lib.mkOption {
      default = -1;
      type = lib.types.int;
      description = "Override MangoWC window border size (px). -1 = use compositor default.";
    };

    # ── Animations ─────────────────────────────────────────────────────────
    animation_speed = lib.mkOption {
      default = 1;
      type = lib.types.int;
      description = "Global animation speed preset. 0=None, 1=Short, 2=Medium, 3=Long, 4=Custom.";
    };

    custom_animation_duration = lib.mkOption {
      default = 500;
      type = lib.types.int;
      description = "Custom global animation duration in milliseconds (used when animationSpeed = 4).";
    };

    sync_component_animation_speeds = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Sync popout and modal animation speeds with the global animationSpeed.";
    };

    popout_animation_speed = lib.mkOption {
      default = 1;
      type = lib.types.int;
      description = "Popout widget animation speed. 0=None, 1=Short, 2=Medium, 3=Long, 4=Custom.";
    };

    popout_custom_animation_duration = lib.mkOption {
      default = 150;
      type = lib.types.int;
      description = "Custom popout animation duration in milliseconds.";
    };

    modal_animation_speed = lib.mkOption {
      default = 1;
      type = lib.types.int;
      description = "Modal dialog animation speed. 0=None, 1=Short, 2=Medium, 3=Long, 4=Custom.";
    };

    modal_custom_animation_duration = lib.mkOption {
      default = 150;
      type = lib.types.int;
      description = "Custom modal animation duration in milliseconds.";
    };

    enable_ripple_effects = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enable Material 3 ripple click effects on interactive elements.";
    };

    # ── Elevation (shadows) ────────────────────────────────────────────────
    m3_elevation_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enable Material 3 elevation shadows on widgets.";
    };

    m3_elevation_intensity = lib.mkOption {
      default = 12;
      type = lib.types.int;
      description = "Elevation shadow spread intensity (0–100).";
    };

    m3_elevation_opacity = lib.mkOption {
      default = 30;
      type = lib.types.int;
      description = "Elevation shadow opacity (0–100).";
    };

    m3_elevation_color_mode = lib.mkOption {
      default = "default";
      type = lib.types.str;
      description = "Elevation shadow color mode. Options: default, custom.";
    };

    m3_elevation_light_direction = lib.mkOption {
      default = "top";
      type = lib.types.str;
      description = "Simulated light direction for elevation shadows. Options: top, bottom, left, right.";
    };

    m3_elevation_custom_color = lib.mkOption {
      default = "#000000";
      type = lib.types.str;
      description = "Custom elevation shadow color (hex). Used when m3ElevationColorMode = \"custom\".";
    };

    modal_elevation_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Apply elevation shadows to modal dialogs.";
    };

    popout_elevation_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Apply elevation shadows to popout widgets.";
    };

    bar_elevation_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Apply elevation shadow to the bar.";
    };

    # ── Blur ───────────────────────────────────────────────────────────────
    blur_enabled = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable background blur on widgets and panels (requires compositor blur support).";
    };

    blur_border_color = lib.mkOption {
      default = "outline";
      type = lib.types.str;
      description = "Color token for the blur border.";
    };

    blur_border_custom_color = lib.mkOption {
      default = "#ffffff";
      type = lib.types.str;
      description = "Custom blur border color (hex).";
    };

    blur_border_opacity = lib.mkOption {
      default = 1.0;
      type = lib.types.float;
      description = "Blur border opacity (0.0–1.0).";
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
