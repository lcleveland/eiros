{ config, lib, ... }:
let
  eiros_xdg_portal = config.eiros.system.desktop_enviroment.xdg_portal;
in
{
  options.eiros.system.desktop_enviroment.xdg_portal = {
    enable = lib.mkOption {
      default = true;
      description = "Enable/Disable XDG Portal for desktop integration.";
      type = lib.types.bool;
    };
  };
  config.xdg.portal = lib.mkIf eiros_xdg_portal.enable {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
