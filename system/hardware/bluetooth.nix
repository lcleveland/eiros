{ config, lib, ... }:
let
  eiros_bluetooth = config.eiros.system.hardware.bluetooth;
in
{
  options.eiros.system.hardware.bluetooth = {
    enable = lib.mkOption {
      default = true;
      description = "Enable Bluetooth support.";
      type = lib.types.bool;
    };

    pipewire = {
      enable = lib.mkOption {
        default = true;
        description = "Enable Bluetooth audio support optimized for PipeWire.";
        type = lib.types.bool;
      };

      roles = lib.mkOption {
        default = [
          "Source"
          "Sink"
          "Media"
          "Socket"
        ];
        description = "Bluetooth audio roles to enable (PipeWire/BlueZ).";
        type = lib.types.listOf lib.types.str;
      };
    };
  };

  config = lib.mkIf eiros_bluetooth.enable {
    hardware = {
      bluetooth = {
        enable = true;

        settings = lib.mkIf eiros_bluetooth.pipewire.enable {
          General = {
            Enable = lib.concatStringsSep "," eiros_bluetooth.pipewire.roles;
          };
        };
      };
    };
  };
}
