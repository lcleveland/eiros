# Installs nix-alien for running unpatched binaries in auto-detected FHS environments.
{ config, lib, pkgs, ... }:
let
  eiros_nix_alien = config.eiros.system.nix.nix_alien;
in
{
  options.eiros.system.nix.nix_alien.enable = lib.mkOption {
    default = true;
    description = "Install nix-alien, which wraps unpatched binaries in a FHS environment by auto-detecting required libraries. Complements nix-ld for cases where the dynamic linker stub is insufficient.";
    example = lib.literalExpression ''
      {
        eiros.system.nix.nix_alien.enable = false;
      }
    '';
    type = lib.types.bool;
  };

  config = lib.mkIf eiros_nix_alien.enable {
    environment.systemPackages = [ pkgs.nix-alien ];
  };
}
