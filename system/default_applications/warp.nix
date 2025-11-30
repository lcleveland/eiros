{ config, lib, ... }:
let
  eiros_warp = config.eiros.system.default_applications.warp;
in
{
  options.eiros.system.default_applications.warp.enable = lib.mkOption {
    description = "Enable warp terminal";
    default = true;
    type = lib.types.bool;
  };
  config.environment.systemPackages = lib.mkIf eiros_warp.enable [
    pkgs.warp-terminal
  ];
}
