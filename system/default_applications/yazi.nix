{ config, lib, ... }:
let
  eiros_yazi = config.eiros.system.default_applications.yazi;
in
{
  options.eiros.system.default_applications.yazi = {
    enable = lib.mkOption {
      default = true;
      description = "Enable yazi";
      type = lib.types.bool;
    };
  };
  config.programs.yazi = lib.mkIf eiros_yazi.enable {
    enable = true;
  };
}
