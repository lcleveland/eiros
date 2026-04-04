{ config, lib, pkgs, ... }:
let
  eiros_eza = config.eiros.system.default_applications.eza;
in
{
  options.eiros.system.default_applications.eza.enable = lib.mkOption {
    default = true;
    description = "Install eza, a modern ls replacement with colour, icons, and git status.";
    type = lib.types.bool;
  };

  config = lib.mkIf eiros_eza.enable {
    environment.systemPackages = [ pkgs.eza ];
  };
}
