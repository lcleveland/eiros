{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_mangowc = config.eiros.system.desktop_environment.mangowc;
in
{
  options.eiros.system.desktop_environment.mangowc = {
    enable = lib.mkOption {
      default = true;
      description = "Enable the Mango Window Composer.";
      type = lib.types.bool;
    };

    package = lib.mkOption {
      default = pkgs.mango;
      description = "Mango Window Composer package to use.";
      type = lib.types.package;
    };
  };

  config = lib.mkIf eiros_mangowc.enable {
    programs = {
      mango = {
        enable = true;
        package = eiros_mangowc.package;
      };
    };
  };
}
