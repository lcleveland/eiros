{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_virtualization = config.eiros.system.virtualization;
  eiros_virt_manager = config.eiros.system.virtualization.virt_manager;
in
{
  options.eiros.system.virtualization.virt_manager = {
    enable = lib.mkOption {
      default = true;
      description = "Virtual machine manager GUI";
      types = lib.types.bool;
    };
    shared_folder_support.enable = {
      default = true;
      description = "Enable shared folder support in virt-manager";
      types = lib.types.bool;
    };
  };
  config = lib.mkIf (eiros_virtualization.enable && eiros_virtualization.virt_manager.enable) {
    virtualisation.libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    };
    programs.virt-manager.enable = true;
  };
}
