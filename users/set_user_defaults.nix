{
  config,
  lib,
  options,
  ...
}:
let
  users = config.eiros.users.default_user_list;
in
{
  options.eiros.users.default_user_list = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "List of users that should have default options applied.";
  };
  config = lib.mkMerge (
    map (name: {
      users.users.${name} = {
        description = lib.mkDefault name;
        extraGroups = lib.mkDefault [
          "wheel"
          "networkmanager"
        ];
        initialPassword = lib.mkDefault name;
        isNormalUser = lib.mkDefault true;
        home = lib.mkDefault "/home/${name}";
      };

      hjem.users.${name} = {
        directory = lib.mkDefault "/home/${name}";
        user = lib.mkDefault name;
      };
    }) users
  );
}
