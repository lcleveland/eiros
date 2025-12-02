{ config, lib, ... }:
let
  users = builtins.attrNames options.users.users;
in
{
  config = {
    users.users = lib.mapAttrs (name: default_config: {
      description = lib.mkDefault name;
      extraGroups = lib.mkDefault [
        "wheel"
        "networkmanager"
      ];
      intialPassword = lib.mkDefault name;
      isNormalUser = lib.mkDefault true;
      home = lib.mkDefault "/home/${name}";
    }) users;
    hjem.users = lib.mapAttrs (name: default_config: {
      directory = lib.mkDefault "home/${name}";
      user = lib.mkDefault name;
    }) users;
  };
}
