{ config, lib, ... }:
let
  eiros_boot = config.eiros.system.boot;
in
{
  options.eiros.system.boot.loader = {
    efi.can_touch_efi_vars = lib.mkEnableOption {
      default = true;
      description = "Allow the kernel to touch EFI variables.";
    };
    systemd.enable = lib.mkEnableOption {
      default = true;
      description = "Use systemd for init";
    };
  };
  config.boot.loader = {
    efi.canTouchEfiVariables = eiros_boot.loader.efi.can_touch_efi_vars;
    systemd-boot.enable = eiros_boot.loader.systemd.enable;
  };
}
