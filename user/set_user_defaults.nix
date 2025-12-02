{
  config,
  options,
  lib,
  ...
}:

let
  userNames = builtins.attrNames options.users.users;
in
{
  config = lib.mkMerge (
    map (name: {
      users.users.${name} = {
        description = lib.mkDefault name;
        extraGroups = lib.mkDefault [
          "wheel"
          "networkmanager"
        ];
        initialPassword = lib.mkDefault name;
        home = lib.mkDefault "/home/${name}";
      };

      hjem.users.${name} = {
        directory = lib.mkDefault "/home/${name}";
        user = lib.mkDefault name;
      };
    }) userNames
  );
}
