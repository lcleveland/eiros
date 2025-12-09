{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_virtualization = config.eiros.system.virtualization;
  eiros_qemu = config.eiros.system.virtualization.qemu;
in
{
  options.eiros.system.virtualization.qemu = {
    enable = lib.mkOption {
      default = true;
      description = "Enable qemu virtual machines";
      type = lib.types.bool;
    };
  };
  config = lib.mkIf (eiros_virtualization.enable && eiros_qemu.enable) {
    environment.systemPackages = [ pkgs.qemu ];
  };
}
