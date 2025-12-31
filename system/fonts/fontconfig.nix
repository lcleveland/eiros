{ config, lib, ... }:
let
  eiros_font_config = config.eiros.system.fonts.font_config;
in
{
  options.eiros.system.fonts.font_config = {
    enable = lib.mkOption {
      default = true;
      description = "Enable Fontconfig.";
      type = lib.types.bool;
    };

    default_fonts = {
      monospace = lib.mkOption {
        default = [ "JetBrainsMono" ];
        description = "Default monospace fonts.";
        type = lib.types.listOf lib.types.str;
      };

      sans_serif = lib.mkOption {
        default = [ "Inter" ];
        description = "Default sans-serif fonts.";
        type = lib.types.listOf lib.types.str;
      };

      serif = lib.mkOption {
        default = [ "Noto Serif" ];
        description = "Default serif fonts.";
        type = lib.types.listOf lib.types.str;
      };
    };
  };

  config.fonts.fontconfig = {
    enable = eiros_font_config.enable;

    defaultFonts = {
      monospace = eiros_font_config.default_fonts.monospace;
      sansSerif = eiros_font_config.default_fonts.sans_serif;
      serif = eiros_font_config.default_fonts.serif;
    };
  };
}
