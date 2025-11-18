{ config, lib, ... }:
let
  eiros_hardware = config.eiros.system.hardware.cpu;
in
{
  options.eiros.system.hardware.cpu = {
    microcode.enable = lib.mkEnableOption {
      default = true;
      description = "Enables or disables CPU microcode support";
    };
    vendor = lib.mkOption {
      default = "amd";
      description = "Sets the CPU vendor";
      type = lib.types.enum [
        "amd"
        "intel"
      ];
    };
  };
  config.hardware.cpu.${eiros_hardware.vendor}.updateMicrocode = eiros_hardware.microcode.enable;
}
