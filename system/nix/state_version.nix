{ config, lib, ... }:
let
  eiros_nix = config.eiros.system.nix;
in
{
  options.eiros.system.nix.state_version = lib.mkOption {
    default = "25.11";
    description = "Version of the NixOS state to use.";
    type = lib.types.str;
  };
  config.system.stateVersion = eiros_nix.state_version;
}
