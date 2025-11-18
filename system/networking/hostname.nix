{ config, lib, ... }:
let
  eiros_networking = config.eiros.system.networking;
in
{
  options.eiros.system.networking.hostname = lib.mkOption {
    type = lib.types.str;
    default = "eiros";
    description = "Hostname to use for the Eiros system.";
  };
  config.networking.hostname = eiros_networking.hostname;
}
