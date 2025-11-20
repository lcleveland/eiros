{
  config,
  inputs,
  lib,
  nixpkgs,
  ...
}:
let
  eiros_niri = config.eiros.system.desktop_environment.niri;
in
{
  options.eiros.system.desktop_environment.niri.enable = lib.mkOption {
    default = true;
    description = "Enable niri desktop environment.";
    type = lib.types.bool;
  };
  config = lib.mkIf eiros_niri.enable {
    nixpkgs.overlays = [ inputs.niri.overlays.niri ];
    programs.niri = {
      enable = true;
      package = pkgs.niri-stable;
    };
  };
}
