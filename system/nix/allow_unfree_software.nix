{ config, lib, ... }:
let
  eiros_nix = config.eiros.system.nix;
in
{
  options.eiros.system.nix.allow_unfree_software.enable = lib.mkEnableOption {
    default = true;
    description = "Allow unfree software in Eiros";
  };
  config.nixpkgs.config.allowUnfree = eiros_nix.allow_unfree_software.enable;
}
