{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_ghostty = config.eiros.system.default_applications.ghostty;
in
{
  options.eiros.system.default_applications.ghostty.enable = lib.mkOption {
    description = "Enable ghostty terminal";
    default = true;
    type = lib.types.bool;
  };
  config.environment.systemPackages = lib.mkIf eiros_ghostty.enable [
    pkgs.ghostty-bin
  ];
}
