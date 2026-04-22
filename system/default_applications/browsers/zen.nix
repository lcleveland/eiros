# Configures Zen Browser with Wayland env vars and optional NVIDIA/EGL support.
{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  eiros_zen = config.eiros.system.default_applications.browsers.zen;

  zenEnvVars =
    [
      # Native Wayland backend.
      "--set MOZ_ENABLE_WAYLAND 1"
      # D-Bus remote protocol required under Wayland (replaces X11 remote).
      "--set MOZ_DBUS_REMOTE 1"
    ]
    # Use EGL instead of GLX on NVIDIA. GLX-based compositing fails on NVIDIA/Wayland
    # hybrid systems; EGL handles cross-driver DMA-BUF negotiation more permissively.
    ++ lib.optionals eiros_zen.nvidia.enable [
      "--set MOZ_X11_EGL 1"
    ]
    ++ lib.map (f: "--add-flags \"${f}\"") eiros_zen.extra_flags;

  zen-wayland =
    (inputs.zen_browser.packages.${pkgs.system}.default).overrideAttrs
      (old: {
        nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ pkgs.makeWrapper ];

        postFixup = (old.postFixup or "") + ''
          wrapProgram $out/bin/zen \
            ${lib.concatStringsSep " \\\n    " zenEnvVars}
        '';
      });
in
{
  options.eiros.system.default_applications.browsers.zen = {
    nvidia = {
      enable = lib.mkOption {
        default = false;
        description = "Enable NVIDIA-specific flags (MOZ_X11_EGL=1). Defaults to eiros.system.hardware.graphics.nvidia.enable. Required for EGL/Wayland on NVIDIA.";
        example = lib.literalExpression ''
          {
            eiros.system.default_applications.browsers.zen.nvidia.enable = true;
          }
        '';
        type = lib.types.bool;
      };
    };

    extra_flags = lib.mkOption {
      default = [ ];
      description = "Additional command-line flags appended to the Zen wrapper.";
      example = lib.literalExpression ''
        {
          eiros.system.default_applications.browsers.zen.extra_flags = [ "--safe-mode" ];
        }
      '';
      type = lib.types.listOf lib.types.str;
    };

    desktop_file = lib.mkOption {
      default = "zen.desktop";
      description = "Desktop file used for default browser associations.";
      example = lib.literalExpression ''
        {
          eiros.system.default_applications.browsers.zen.desktop_file = "zen-browser.desktop";
        }
      '';
      type = lib.types.str;
    };

    enable = lib.mkOption {
      default = true;
      description = "Enable Zen Browser as the default browser.";
      example = lib.literalExpression ''
        {
          eiros.system.default_applications.browsers.zen.enable = false;
        }
      '';
      type = lib.types.bool;
    };

    package = lib.mkOption {
      default = zen-wayland;
      description = "Zen Browser package to install (Wayland-wrapped).";
      example = lib.literalExpression ''
        {
          eiros.system.default_applications.browsers.zen.package = inputs.zen_browser.packages.x86_64-linux.default;
        }
      '';
      type = lib.types.package;
    };
  };

  config = lib.mkMerge [
    {
      eiros.system.default_applications.browsers.zen.nvidia.enable = lib.mkDefault (
        config.eiros.system.hardware.graphics.nvidia.enable or false
      );
    }

    (lib.mkIf eiros_zen.enable {
      environment.systemPackages = [
        eiros_zen.package
      ];

      xdg.mime.defaultApplications = {
        "text/html" = [ eiros_zen.desktop_file ];
        "x-scheme-handler/http" = [ eiros_zen.desktop_file ];
        "x-scheme-handler/https" = [ eiros_zen.desktop_file ];
      };
    })
  ];
}
