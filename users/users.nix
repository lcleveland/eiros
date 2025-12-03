{ config, lib, ... }:
{
  options.eiros.users = lib.mkOption {
    default = [ ];
    type = lib.types.attrOf (
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
          };
        }
      )
    );
  };
  config = {
    users.users = mapAttrs (username: user_config: {
      extraGroups = lib.mkDefault user_config.extraGroups;
    }) config.eiros.users;
  };
}
