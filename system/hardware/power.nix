{ config, lib, ... }:
{
  options.eiros.system.hardware.power = {
    upower.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable UPower for power management.";
    };
  };

  config = {
    services.upower.enable = config.eiros.system.hardware.power.upower.enable;
  };
}
