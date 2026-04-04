{ config, lib, ... }:
let
  eiros_power_profiles = config.eiros.system.hardware.power_profiles;
in
{
  options.eiros.system.hardware.power_profiles.enable = lib.mkOption {
    default = false;
    description = "Enable power-profiles-daemon for dynamic CPU power profiles (performance, balanced, power-saver). Integrates with the DMS control center. Incompatible with eiros.system.hardware.power.cpu_governor — set that to null when enabling this.";
    type = lib.types.bool;
  };

  config = lib.mkIf eiros_power_profiles.enable {
    assertions = [
      {
        assertion = config.powerManagement.cpuFreqGovernor == null;
        message = "power_profiles is enabled but powerManagement.cpuFreqGovernor is set. Set eiros.system.hardware.power.cpu_governor to null to avoid conflicts.";
      }
    ];

    services.power-profiles-daemon.enable = true;
  };
}
