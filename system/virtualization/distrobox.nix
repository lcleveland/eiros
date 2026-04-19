# Installs distrobox for running containerized Linux distributions on the host.
# Requires Docker (managed by docker.nix) as the container backend.
# NVIDIA GPU access is provided by hardware.nvidia-container-toolkit (CDI) configured in graphics.nix.
{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_virtualization = config.eiros.system.virtualization;
  eiros_distrobox = eiros_virtualization.distrobox;
in
{
  options.eiros.system.virtualization.distrobox.enable = lib.mkOption {
    default = true;
    description = "Enable distrobox.";
    example = lib.literalExpression ''
      {
        eiros.system.virtualization.distrobox.enable = false;
      }
    '';
    type = lib.types.bool;
  };

  config = lib.mkIf (eiros_virtualization.enable && eiros_distrobox.enable) {
    environment.systemPackages = [ pkgs.distrobox ];
  };
}
