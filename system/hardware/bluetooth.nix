{ config, lib, ... }:
let
  eiros_bluetooth = config.eiros.system.hardware.bluetooth;
in
{
  options.eiros.system.hardware.bluetooth = {
    enable = lib.mkOption {
      default = true;
      description = "Enable bluetooth support";
      type = lib.types.bool;
    };
  };
  config.hardware.bluetooth.enable = eiros_bluetooth.enable;
}
