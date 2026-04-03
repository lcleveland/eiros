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

    cpu_governor = lib.mkOption {
      default = "schedutil";
      description = "CPU frequency scaling governor. schedutil is recommended for modern kernels as it hooks directly into the scheduler.";
      type = lib.types.str;
    };
  };

  config = {
    services.upower.enable = eiros_power.upower.enable;
    powerManagement.cpuFreqGovernor = lib.mkDefault eiros_power.cpu_governor;
  };
}
