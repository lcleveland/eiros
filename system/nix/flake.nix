{ config, lib, ... }:
let
  eiros_nix = config.eiros.system.nix;
in
{
  options.eiros.system.nix.flake.enable = lib.mkEnableOption {
    default = true;
    description = "Enable flakes in Eiros";
  };
  config.nix.settings.expermental-features = lib.mkIf eiros_nix.flake.enable "nix-command flakes";
}
