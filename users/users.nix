{
  config,
  hjem,
  lib,
  pkgs,
  ...
}:

{
  options.eiros.users = lib.mkOption {
    description = "Eiros-managed users that expand into users.users + hjem.users.";
    type = lib.types.attrsOf (
      lib.types.submodule (
        { name, ... }:
        {
          #### Per-Eiros-user options
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
              description = "Home directory (defaults to /home/${name}).";
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

            # Optional extra hjem options to merge into hjem.users.<name>
            hjem = lib.mkOption {
              type = lib.types.attrs;
              default = { };
              description = "Extra options merged into hjem.users.<name>.";
            };
          };

          #### How each Eiros user expands into users.users + hjem.users
          config = lib.mkIf config.enable (
            let
              homeDir = if config.home != null then config.home else "/home/${name}";

              hjemDir = if config.hjemDirectory != null then config.hjemDirectory else homeDir;

              shellPkg = if config.shell != null then config.shell else pkgs.bashInteractive;

              initialPw = if config.initialPassword != null then config.initialPassword else name;
            in
            {
              users.users.${name} = {
                isNormalUser = true;
                description = config.description;
                home = homeDir;
                shell = shellPkg;
                initialPassword = initialPw;
                extraGroups = config.extraGroups;
              }
              // config.users.users;

              hjem.users.${name} = {
                user = name;
                directory = hjemDir;

                # Example of using the flake input inside the submodule:
                # modules = [ hjem.homeModules.default ];
              }
              // config.hjem;
            }
          );
        }
      )
    );
    default = { };
  };
}
