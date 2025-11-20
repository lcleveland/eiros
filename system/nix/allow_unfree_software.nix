{ config, lib, ... }:
let
  eiros_nix = config.eiros.system.nix;
in
{
  options.eiros.system.nix.allow_unfree_software.enable = lib.mkOption {
    default = true;
    description = "Allow unfree software in Eiros";
    type = lib.types.bool;
  };
  config.nixpkgs.config.allowUnfree = eiros_nix.allow_unfree_software.enable;
}
