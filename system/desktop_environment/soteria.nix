{ config, lib, ... }:
let
  eiros_soteria = config.eiros.system.desktop_environment.soteria;
in
{
  options.eiros.system.desktop_environment.soteria = {
    enable = lib.mkOption {
      default = false;
      description = "Enable Soteria";
      type = lib.types.bool;
    };
  };
  config.security.soteria.enable = eiros_soteria.enable;
}
