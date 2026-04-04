{ config, lib, ... }:
let
  eiros_mangowc = config.eiros.system.desktop_environment.mangowc;
in
{
  options.eiros.system.desktop_environment.mangowc = {
    enable = lib.mkOption {
      default = true;
      description = "Enable the Mango Window Composer.";
      type = lib.types.bool;
    };

    systemd = {
      enable = lib.mkOption {
        default = true;
        description = "Enable systemd user session target integration for MangoWC.";
        type = lib.types.bool;
      };

      variables = lib.mkOption {
        default = [
          "DISPLAY"
          "WAYLAND_DISPLAY"
          "XDG_CURRENT_DESKTOP"
          "XDG_SESSION_TYPE"
          "NIXOS_OZONE_WL"
          "XCURSOR_THEME"
          "XCURSOR_SIZE"
        ];
        description = "Environment variables to import into the systemd user session on MangoWC startup.";
        type = lib.types.listOf lib.types.str;
      };
    };
  };

  config = lib.mkIf eiros_mangowc.enable {
    programs.mango.enable = true;

    systemd.user.targets.mango-session = lib.mkIf eiros_mangowc.systemd.enable {
      description = "MangoWC compositor session";
      bindsTo = [ "graphical-session.target" ];
      wants = [ "graphical-session-pre.target" ];
      after = [ "graphical-session-pre.target" ];
    };
  };
}
