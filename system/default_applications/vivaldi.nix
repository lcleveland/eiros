{
  config,
  lib,
  pkgs,
  ...
}:

let
  eiros_vivaldi = config.eiros.system.default_applications.vivaldi;

  # Centralized flags so they're easy to tweak/extend.
  vivaldiFlags = [
    # Wayland / Ozone
    "--ozone-platform=wayland"
    "--enable-features=UseOzonePlatform,ExternalProtocolDialog"
    "--disable-features=IntentPicker"

    # Prefer native EGL on NVIDIA; avoid ANGLE-on-GL path
    "--use-gl=egl"
    "--disable-angle"

    # Try Vulkan path (often improves stability on Wayland/NVIDIA)
    "--enable-features=Vulkan"
    "--use-vulkan"

    # Optional: only if you *need* it for multi-GPU selection
    # "--render-node-override=/dev/dri/renderD129"
  ];

  # Wrap Vivaldi to always use Wayland/Ozone + your feature flags
  vivaldi-wayland = pkgs.vivaldi.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ pkgs.makeWrapper ];

    postFixup = (old.postFixup or "") + ''
      wrapProgram $out/bin/vivaldi \
        --add-flags "${lib.concatStringsSep " " (map lib.escapeShellArg vivaldiFlags)}"
    '';
  });

in
{
  options.eiros.system.default_applications.vivaldi = {
    desktop_file = lib.mkOption {
      default = "vivaldi.desktop";
      description = "Desktop file used for default browser associations.";
      type = lib.types.str;
    };

    enable = lib.mkOption {
      default = true;
      description = "Enable Vivaldi as the default browser.";
      type = lib.types.bool;
    };

    package = lib.mkOption {
      default = vivaldi-wayland;
      description = "Vivaldi package to install (Wayland/EGL/Vulkan wrapped).";
      type = lib.types.package;
    };
  };

  config = lib.mkIf eiros_vivaldi.enable {
    assertions = [
      {
        assertion = config.nixpkgs.config.allowUnfree or false;
        message = "Vivaldi requires nixpkgs.config.allowUnfree = true.";
      }
    ];

    environment.systemPackages = [
      eiros_vivaldi.package
    ];

    xdg.mime.defaultApplications = {
      "text/html" = [ eiros_vivaldi.desktop_file ];
      "x-scheme-handler/http" = [ eiros_vivaldi.desktop_file ];
      "x-scheme-handler/https" = [ eiros_vivaldi.desktop_file ];
    };
  };
}
