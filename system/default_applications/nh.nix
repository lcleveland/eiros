{ config, lib, ... }:
let
  eiros_nh = config.eiros.system.default_applications.nh;
in
{
  options.eiros.system.default_applications.nh = {
    enable = lib.mkOption {
      default = true;
      description = "Enable NH";
      type = lib.types.bool;
    };
  };
  config.programs.nh = lib.mkIf eiros_nh.enable {
    enable = true;
  };
}
