{ config, lib, ... }:
let
  eiros_mangowc = config.eiros.system.desktop_environment.mangowc;
in
{
  options.eiros.system.desktop_environment.mangowc.enable = lib.mkOption {
    description = "Enables the Mango Window Composer.";
    default = true;
    type = lib.types.bool;
  };
  config.programs.mango.enable = eiros_mangowc.enable;
}
