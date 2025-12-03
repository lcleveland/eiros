{ config, lib, ... }:
let
  #  defaultUsers = config.eiros.users.default_user_list;
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
        isNormalUser = lib.mkDefault true;
        home = lib.mkDefault "/home/${name}";
      };

      hjem.users.${name} = {
        directory = lib.mkDefault "/home/${name}";
        user = lib.mkDefault name;
      };
    }) [ "eiros" ]
  );
}
