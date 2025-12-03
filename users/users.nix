{
  config,
  lib,
  pkgs,
  ...
}:

{
  ###########################
  ## 1. Declare Eiros user options
  ###########################

  options.eiros.users = lib.mkOption {
    description = "Eiros-managed users";
    type = lib.types.attrsOf (
      lib.types.submodule (
        { name, ... }:
        {
          options = {
            enable = lib.mkOption {
              type = lib.types.bool;
              default = true;
              description = "Whether to create this user.";
            };

            description = lib.mkOption {
              type = lib.types.str;
              default = name;
              description = "Display name.";
            };

            extraGroups = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              default = [
                "wheel"
                "networkmanager"
              ];
              description = "Extra groups for this user.";
            };

            home = lib.mkOption {
              type = lib.types.nullOr lib.types.str;
              default = null;
              description = "Home dir (defaults to /home/<name>).";
            };

            shell = lib.mkOption {
              type = lib.types.nullOr lib.types.package;
              default = null;
              description = "Shell (you can default this later if you like).";
            };

            initialPassword = lib.mkOption {
              type = lib.types.nullOr lib.types.str;
              default = null;
              description = "Initial password (defaults to username).";
            };
          };
        }
      )
    );
    default = { };
  };

  ###########################
  ## 2. Turn eiros.users.* into users.users.* + hjem.users.*
  ###########################

  config = lib.mkMerge (
    lib.mapAttrsToList (
      name: ucfg:
      lib.mkIf ucfg.enable (
        let
          homeDir = if ucfg.home != null then ucfg.home else "/home/${name}";

          initialPw = if ucfg.initialPassword != null then ucfg.initialPassword else name;
        in
        {
          users.users.${name} = {
            isNormalUser = true;
            description = ucfg.description;
            home = homeDir;
            initialPassword = initialPw;
            extraGroups = ucfg.extraGroups;
            # shell = ucfg.shell or pkgs.zsh;  # if you want a default
          };

          hjem.users.${name} = {
            user = name;
            directory = homeDir;
          };
        }
      )
    ) config.eiros.users
  );
}
