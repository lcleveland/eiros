{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_usb_storage = config.eiros.system.hardware.usb_storage;
in
{
  options.eiros.system.hardware.usb_storage = {
    udiskie.enable = lib.mkOption {
      default = true;
      description = "Enable USB storage automount support (udisks2 + udiskie).";
      type = lib.types.bool;
    };
  };

  config = lib.mkIf eiros_usb_storage.udiskie.enable {
    services.udisks2.enable = true;
    environment.systemPackages = [ pkgs.udiskie ];
  };
}
