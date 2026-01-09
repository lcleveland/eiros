{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.eiros.system.virtualization.podman;
in
{
  options.eiros.system.virtualization.podman = {
    enable = lib.mkOption {
      default = true;
      description = "Enable podman";
      type = lib.types.bool;
    };

    # Add this: enable compose tooling
    compose = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Install a compose provider so `podman compose` / `podman-compose` works.";
      };

      provider = lib.mkOption {
        type = lib.types.enum [
          "podman-compose"
          "docker-compose"
        ];
        default = "podman-compose";
        description = ''
          Which compose provider to install.

          - "podman-compose": python-based tool (`podman-compose ...`)
          - "docker-compose": Docker Compose v2 binary (`podman compose ...` can use it as provider)
        '';
      };
    };
  };

  config = lib.mkIf config.eiros.system.virtualization.enable (
    lib.mkMerge [
      # Podman baseline
      (lib.mkIf cfg.enable {
        virtualisation = {
          containers = {
            enable = true;
          };
          podman = {
            enable = true;
            dockerCompat = true;
            defaultNetwork.settings.dns_enabled = true;
          };
        };
      })

      # Compose provider installation
      (lib.mkIf (cfg.enable && cfg.compose.enable) {
        environment.systemPackages =
          let
            composePkg =
              if cfg.compose.provider == "podman-compose" then pkgs.podman-compose else pkgs.docker-compose;
          in
          [
            composePkg
          ];
      })
    ]
  );
}
