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

  config = lib.mkIf cfg.enable {
    eiros.users.eiros = {
    };
  };
}
