# Enables the systemd-based initrd, the modern NixOS early-boot path.
{ config, lib, ... }:
let
  eiros_initrd = config.eiros.system.boot.initrd;
in
{
  options.eiros.system.boot.initrd = {
    systemd.enable = lib.mkOption {
      default = true;
      description = ''
        Use the systemd-based initrd instead of the legacy shell-script initrd.
        Cleaner device/mount handling and faster boot, and the recommended path for
        LUKS setups. Disable if an exotic LUKS or NVIDIA early-KMS configuration
        misbehaves under systemd-initrd.
      '';
      example = lib.literalExpression ''
        {
          eiros.system.boot.initrd.systemd.enable = false;
        }
      '';
      type = lib.types.bool;
    };
  };

  config = lib.mkIf eiros_initrd.systemd.enable {
    boot.initrd.systemd.enable = true;
  };
}
