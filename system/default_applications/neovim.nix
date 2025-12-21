{ config, lib, ... }:
let
  eiros_neovim = config.eiros.system.default_applications.neovim;
in
{
  options.eiros.system.default_applications.neovim.enable = lib.mkOption {
    default = true;
    description = "Whether or not to use NeoVim as the editor for Eiros";
    type = lib.types.bool;
  };
  config.programs.neovim = lib.mkIf (eiros_neovim.enable) {
    defaultEditor = true;
    enable = true;
  };
}
