{ config, lib, ... }:
let
  eiros_usb = config.eiros.system.hardware.usb_storage;
in
{
  options.eiros.system.hardware.usb_storage = {
    udiskie.enable = lib.mkOption {
      default = true;
      description = "Mount USB storage device";
      type = lib.types.bool;
    };
  };
}
