{ config, lib, ... }:
let
  eiros_power = config.eiros.system.hardware.power;
in
{
  options.eiros.system.hardware.power = {
    upower.enable = lib.mkOption {
      default = true;
      description = "Enable UPower for power management.";
      type = lib.types.bool;
    };
  };

  config.services.upower.enable = eiros_power.upower.enable;
}
