# Configures Bluetooth hardware support.
{ config, lib, ... }:
let
  eiros_bluetooth = config.eiros.system.hardware.bluetooth;
in
{
  options.eiros.system.hardware.bluetooth = {
    enable = lib.mkOption {
      default = true;
      description = "Enable Bluetooth support.";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.bluetooth.enable = false;
        }
      '';
      type = lib.types.bool;
    };
  };

  config = lib.mkIf eiros_bluetooth.enable {
    hardware.bluetooth.enable = true;
  };
}
