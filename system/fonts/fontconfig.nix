{ config, lib, ... }:
{
  options.eiros.system.fonts.font_config.enable = lib.mkOption {
    default = true;
    description = "Enable fontconfig";
    type = lib.types.bool;
  };
  config.fonts.fontconfig.enable = config.eiros.system.fonts.font_config.enable;
}
