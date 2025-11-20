{ config, lib, ... }:
let
  eiros_regreet = config.eiros.system.desktop_environment.regreet;
in
{
  optios.eiros.system.desktop_environment.regreet.enable = lib.mkOption {
    default = true;
    description = "Enable Regreet display manager";
    type = lib.types.bool;
  };
  config.programs.regreet = lib.mkIf eiros_regreet.enable {
    enable = true;
  };
}
