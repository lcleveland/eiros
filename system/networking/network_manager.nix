{ config, lib, ... }:
let
  eiros_networking = config.eiros.system.networking;
in
{
  options.eiros.system.networking.network_manager.enable = lib.mkEnableOption {
    default = true;
    description = "Use NetworkManager for network configuration.";
  };
  config.networking.networkmanager = lib.mkIf eiros_networking.network_manager.enable {
    enable = true;
    wifi = lib.mkIf eiros_networking.iwd.enable {
      backend = "iwd";
    };
  };
}
