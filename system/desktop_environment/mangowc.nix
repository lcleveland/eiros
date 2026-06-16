# Enables the MangoWC Wayland compositor and configures its systemd environment import.
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  eiros_mangowc = config.eiros.system.desktop_environment.mangowc;
in
{
  options.eiros.system.desktop_environment.mangowc = {
    enable = lib.mkOption {
      default = true;
      description = "Enable the Mango Window Composer.";
      example = lib.literalExpression ''
        {
          eiros.system.desktop_environment.mangowc.enable = false;
        }
      '';
      type = lib.types.bool;
    };

    systemd = {
      enable = lib.mkOption {
        default = true;
        description = "Propagate Wayland session environment variables into systemd and D-Bus on MangoWC startup.";
        example = lib.literalExpression ''
          {
            eiros.system.desktop_environment.mangowc.systemd.enable = false;
          }
        '';
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
          "GNOME_KEYRING_CONTROL"
        ];
        description = "Environment variables to import into the systemd user session on MangoWC startup.";
        example = lib.literalExpression ''
          {
            eiros.system.desktop_environment.mangowc.systemd.variables = [
              "WAYLAND_DISPLAY"
              "XDG_CURRENT_DESKTOP"
            ];
          }
        '';
        type = lib.types.listOf lib.types.str;
      };
    };
  };

  config = lib.mkIf eiros_mangowc.enable {
    programs.mango = {
      enable = true;
      # Upstream mango omits libdrm from buildInputs, but src/draw/text-node.c
      # includes <drm_fourcc.h>. The header lives in libdrm's include/libdrm
      # subdir, which is only reachable via libdrm's pkg-config Cflags, so add
      # both the input and the explicit include path until upstream fixes this.
      package =
        inputs.mango.packages.${pkgs.stdenv.hostPlatform.system}.mango.overrideAttrs
          (old: {
            buildInputs = (old.buildInputs or [ ]) ++ [ pkgs.libdrm ];
            NIX_CFLAGS_COMPILE =
              (old.NIX_CFLAGS_COMPILE or "") + " -I${pkgs.lib.getDev pkgs.libdrm}/include/libdrm";
          });
    };
  };
}
