{ config, lib, ... }:
let
  eiros_niri = config.eiros.system.desktop_environment.niri;
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
    waylandCompositors = {
      niri = lib.mkIf eiros_niri.enable {
        prettyName = "Niri";
        comment = "Niri compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/niri";
      };
    };
  };
}
