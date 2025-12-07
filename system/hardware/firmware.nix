{ config, lib, ... }:
let
  eiros_firmware = config.eiros.system.hardware.firmware;
in
{
  options.eiros.system.hardware.firmware = {
    enable_all_firmware = lib.mkOption {
      default = true;
      description = "Enable all supported firmware";
      type = lib.types.bool;
    };
  };
  config.hardware.enableAllFirmware = eiros_firmware.enable_all_firmware;
}
