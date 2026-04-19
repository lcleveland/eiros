# DMS theme and matugen color generation options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms = {

    # ── Theme ──────────────────────────────────────────────────────────────
    current_theme_name = lib.mkOption {
      default = "purple";
      type = lib.types.str;
      description = "Active DMS built-in theme name (e.g. purple, blue, green, red, orange, yellow, pink, grey) or 'custom' to use customThemeFile.";
    };

    current_theme_category = lib.mkOption {
      default = "generic";
      type = lib.types.str;
      description = "Theme category used for theme registry grouping.";
    };

    custom_theme_file = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Absolute path to a custom theme JSON file. Only used when currentThemeName = \"custom\".";
    };

    registry_theme_variants = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Custom theme variant registry entries.";
    };

    matugen_scheme = lib.mkOption {
      default = "scheme-tonal-spot";
      type = lib.types.str;
      description = "Matugen color generation algorithm. Options: scheme-tonal-spot, scheme-content, scheme-expressive, scheme-fidelity, scheme-fruit-salad, scheme-monochrome, scheme-neutral, scheme-rainbow.";
    };

    matugen_contrast = lib.mkOption {
      default = 0.0;
      type = lib.types.float;
      description = "Matugen contrast level (-1.0 to 1.0). 0 = default contrast.";
    };

    run_user_matugen_templates = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Run user-defined matugen templates on theme or wallpaper change.";
    };

    matugen_target_monitor = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Monitor to sample wallpaper colors from for matugen. Empty = focused monitor.";
    };

  };
}
