{ config, lib, ... }:
{
  options.eiros.users = lib.mkOption {
    default = [ ];
    type = lib.types.listOf (
      lib.types.submodule (
        { username, ... }:
        {
          options = {
            extraGroups = lib.mkOption {
              default = [
                "wheel"
                "networkmanager"
              ];
              description = "Default groups";
              type = lib.types.listOf lib.types.str;
            };
            username = lib.mkOption {
              description = "Username";
              type = lib.types.str;
            };
          };
        }
      )
    );
  };
  config = {
    users.users = lib.listToAttrs (
      map (user: {
        extraGroups = lib.mkDefault user.extraGroups;
        isNormalUser = true;
        name = user.username;
      }) config.eiros.users
    );
  };
}
