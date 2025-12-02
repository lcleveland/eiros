{
  config,
  lib,
  options,
  ...
}:
let
  users = builtins.attrNames options.users.users;
in
{
  options.eiros.users.default_user_list = lib.mkOption {
    types = lib.types.listOf lib.types.str;
    default = [ ];
    description = "List of users that should have default options applied.";
  };
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
