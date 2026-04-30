# Exposes eiros flake source URLs as system environment variables.
{ config, lib, ... }:
let
  eiros_sources = config.eiros.system.nix.sources;
in
{
  options.eiros.system.nix.sources = {
    users = {
      url = lib.mkOption {
        default = "github:lcleveland/eiros.users";
        description = "Flake URL for the eiros users module.";
        example = lib.literalExpression ''
          {
            eiros.system.nix.sources.users.url = "github:myfork/eiros.users";
          }
        '';
        type = lib.types.str;
      };
    };

    hardware = {
      url = lib.mkOption {
        default = "github:lcleveland/eiros.hardware";
        description = "Flake URL for the eiros hardware override module.";
        example = lib.literalExpression ''
          {
            eiros.system.nix.sources.hardware.url = "github:myfork/eiros.hardware";
          }
        '';
        type = lib.types.str;
      };
    };
  };

  config = {
    environment.variables = {
      EIROS_USERS_URL = eiros_sources.users.url;
      EIROS_HARDWARE_URL = eiros_sources.hardware.url;
    };
  };
}
