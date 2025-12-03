{
  config,
  lib,
  pkgs,
  ...
}:

{
  ###########################
  ## 1. Declare eiros.users.* options
  ###########################

  options.eiros.users = lib.mkOption {
    description = "Eiros-managed users that expand into users.users + hjem.users.";
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
              description = "Display name / GECOS field.";
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
              description = "Home directory (defaults to /home/<name>).";
            };

            shell = lib.mkOption {
              type = lib.types.nullOr lib.types.package;
              default = null;
              description = "Shell (defaults to pkgs.bashInteractive).";
            };

            initialPassword = lib.mkOption {
              type = lib.types.nullOr lib.types.str;
              default = null;
              description = "Initial password (defaults to username).";
            };

            hjemDirectory = lib.mkOption {
              type = lib.types.nullOr lib.types.str;
              default = null;
              description = "hjem directory (defaults to same as home).";
            };
          };
        }
      )
    );
    default = { };
  };

  ###########################
  ## 2. Expand eiros.users.* \u2192 users.users.* + hjem.users.*
  ###########################

  config = lib.mkMerge (
    lib.mapAttrsToList (
      name: ucfg:
      lib.mkIf ucfg.enable (
        let
          homeDir = if ucfg.home != null then ucfg.home else "/home/${name}";

          hjemDir = if ucfg.hjemDirectory != null then ucfg.hjemDirectory else homeDir;

          shellPkg = if ucfg.shell != null then ucfg.shell else pkgs.bashInteractive;

          initialPw = if ucfg.initialPassword != null then ucfg.initialPassword else name;
        in
        {
          users.users.${name} = {
            isNormalUser = true;
            description = ucfg.description;
            home = homeDir;
            shell = shellPkg;
            initialPassword = initialPw;
            extraGroups = ucfg.extraGroups;
          };

          hjem.users.${name} = {
            user = name;
            directory = hjemDir;
          };
        }
      )
    ) config.eiros.users
  );
}
