{ config, lib, ... }:
let
  eiros_uwsm = config.eiros.system.desktop_environment.uwsm;
in
{
  options.eiros.system.desktop_environment.uwsm = {
    enable = lib.mkOption {
      default = true;
      description = "Whether to enable universal wayland session manager";
      type = lib.types.bool;
    };
  };
  config.programs.uwsm = lib.mkIf eiros_uwsm.enable {
    enable = true;
  };
}
