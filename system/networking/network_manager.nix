{ config, lib, ... }:
let
  eiros_networking = config.eiros.system.networking;
in
{
  options.eiros.system.networking.network_manager.enable = lib.mkOption {
    default = true;
    description = "Use NetworkManager for network configuration.";
    type = lib.types.bool;
  };
  config.networking.networkmanager = lib.mkIf eiros_networking.network_manager.enable {
    enable = true;
    wifi = lib.mkIf eiros_networking.iwd.enable {
      backend = "iwd";
    };
  };
}
