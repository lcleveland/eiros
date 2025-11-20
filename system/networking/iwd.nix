{ config, lib, ... }:
let
  iwd = config.eiros.system.networking.iwd;
in
{
  options.eiros.system.networking.iwd.enable = lib.mkOption {
    default = true;
    description = "Use iwd to manage network connections";
    type = lib.types.bool;
  };
  config.networking.wireless.iwd = lib.mkIf iwd.enable {
    enable = true;
    settings.Settings.AutoConnect = true;
  };
}
