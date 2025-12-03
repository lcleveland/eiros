{ config, lib, ... }:
{
  options.eiros.users = lib.mkOption {
    default = [ ];
    type = lib.types.attrsOf (
      lib.types.submodule (
        { name, ... }:
        {
          options = {
            extra_groups = lib.mkOption {
              default = [
                "wheel"
                "networkmanager"
              ];
              description = "Default groups";
              type = lib.types.listOf lib.types.str;
            };
            initial_password = lib.mkOption {
              default = name;
              description = "Initial password for the user.";
              type = lib.types.str;
            };
          };
        }
      )
    );
  };
  config = {
    users.users = lib.mapAttrs (username: user_config: {
      extraGroups = lib.mkDefault user_config.extra_groups;
      initialPassword = lib.mkDefault user_config.initial_password;
      isNormalUser = lib.mkDefault true;
    }) config.eiros.users;
    hjem.users = lib.mapAttrs (username: user_config: {
      user = username;
      directory = lib.mkDefault "/home/${username}";
      files = {
      };
    }) config.eiros.users;
  };
}
