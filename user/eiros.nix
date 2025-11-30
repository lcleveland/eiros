{ config, lib, ... }:
let
  eiros_user = config.eiros.user.eiros;
in
{
  options.eiros.user.eiros = {
    enable = lib.mkOption {
      description = "Enable the default Eiros user";
      default = true;
      type = lib.types.bool;
    };
    groups = lib.mkOption {
      description = "The default groups for this user.";
      default = [
        "wheel"
        "networkmanager"
      ];
      type = lib.types.listOf lib.types.str;
    };
    name = lib.mkOption {
      description = "The full name of the Eiros user";
      default = "Eiros Default User";
      type = lib.types.str;
    };
    username = lib.mkOption {
      description = "The username for the Eiros user.";
      default = "eiros";
      type = lib.types.str;
    };
  };
  config = lib.mkIf eiros_user.enable {
    users.users.${eiros_user.username} = {
      description = eiros_user.name;
      extraGroups = eiros_user.groups;
      isNormalUser = true;
      isSystemUser = false;
      initialPassword = eiros_user.name;
    };
  };
}
