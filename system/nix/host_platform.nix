{ config, lib, ... }:
let
  eiros_nix = config.eiros.system.nix;
in
{
  options.eiros.system.nix.host_platform = lib.mkOption {
    default = "x86_64-linux";
    description = "The platform that the nix daemon is running on.";
    type = lib.types.enum [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
  config.nixpkgs.hostPlatform = eiros_nix.host_platform;
}
