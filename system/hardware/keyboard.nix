{ config, lib, ... }:
let
  eiros_hardware = config.eiros.system.hardware;
in
{
  options.eiros.system.hardware.keyboard = {
    layout = lib.mkOption {
      type = lib.types.str;
      default = "us";
      description = "Keyboard layout to use (xkb-data-style)";
    };
    variant = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "The layout variant to use";
    };
  };
  config.services.xserver.xkb = {
    layout = eiros_hardware.keyboard.layout;
    variant = eiros_hardware.keyboard.variant;
  };
}
