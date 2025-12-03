{ config, lib, ... }:
{
  options.eiros.users = lib.mkOption {
    default = [ ];
    type = lib.types.attrsOf (
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
    users.users = lib.mapAttrs (username: user_config: {
      isNormalUser = lib.mkDefault true;
      extraGroups = lib.mkDefault user_config.extraGroups;
    }) config.eiros.users;
    hjem.users = lib.mapAttrs (username: user_config: {
      user = username;
      directory = lib.mkDefault "/home/${username}";
    }) config.eiros.users;
  };
}
