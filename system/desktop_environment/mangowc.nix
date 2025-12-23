{
  config,
  lib,
  ...
}:
let
  eiros_mangowc = config.eiros.system.desktop_environment.mangowc;
{
  options.eiros.system.desktop_environment.mangowc.enable = lib.mkOption {
    description = "Enables the Mango Window Composer.";
    default = true;
    type = lib.types.bool;
  };

  config = lib.mkIf eiros_mangowc.enable {
    programs.mango.enable = true;
  };
}
