{ config, lib, ... }:

let
  cfg = config.eiros.default_user;
in
{
  options.eiros.default_user = {
    enable = lib.mkOption {
      description = "Enable the default Eiros user";
      default = true;
      type = lib.types.bool;
    };
  };

  # If enabled, define eiros.users.eiros (data only, no reading from eiros.users here)
  config = lib.mkIf cfg.enable {
    eiros.users.eiros = {
      # You can add per-user settings here later if you like
      # description = "Eiros";
      # extraGroups = [ "docker" ];
    };
  };
}
