{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.eiros.system.virtualization.podman = {
    enable = lib.mkOption {
      default = true;
      description = "Enable podman";
      type = lib.types.bool;
    };
  };
  config = lib.mkIf config.eiros.system.virtualization.enable {
    virtualisation = {
      containers.enable = true;
      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };
  };
}
