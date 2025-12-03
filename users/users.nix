{
  config,
  lib,
  pkgs,
  ...
}:

let
  eiros_users = config.eiros.users or { };
in
{
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
              description = "Extra groups on top of defaults.";
            };

            home = lib.mkOption {
              type = lib.types.nullOr lib.types.str;
              default = null;
              description = "Home dir ";
            };

            shell = lib.mkOption {
              type = lib.types.nullOr lib.types.package;
              default = null;
              description = "Shell (defaults to eiros.defaults.shell).";
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
          };

          hjem.users.${name} = {
            user = name;
            directory = homeDir;
          };
        }
      )
    ) eiros_users
  );
}
