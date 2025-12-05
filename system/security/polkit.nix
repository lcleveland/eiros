{ config, lib, ... }:
let
  eiros_polkit = config.eiros.system.security.polkit;
in
{
  options.eiros.system.security.polkit = {
    enable = lib.mkOption {
      default = true;
      description = "Enable Polkit";
      type = lib.types.bool;
    };
  };
  config.security.polkit = lib.mkIf eiros_polkit.enable {
    enable = true;
  };
}
