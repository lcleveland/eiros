{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.eiros.default_user;
in
{
  ###########################
  ## 1. Schema for eiros.users.*
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
              description = "Shell (defaults set in users.nix or host).";
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
  ## 2. Toggle for default Eiros user
  ###########################

  options.eiros.default_user.enable = lib.mkOption {
    description = "Enable the default Eiros user";
    default = true;
    type = lib.types.bool;
  };

  ###########################
  ## 3. If enabled, define eiros.users.eiros (data only)
  ###########################

  config = lib.mkIf cfg.enable {
    # NOTE: we only WRITE into eiros.users here.
    # We NEVER read config.eiros.users.* in this file.
    eiros.users.eiros = {
      # optional: you can override any defaults here
      description = "Eiros";
      # extraGroups   = [ "wheel" "networkmanager" "docker" ];
      # initialPassword = "eiros";
      # shell         = pkgs.zsh;
    };
  };
}
