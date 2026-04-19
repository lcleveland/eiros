# Enables the Docker container runtime (system daemon).
{ config, lib, ... }:
let
  eiros_virtualization = config.eiros.system.virtualization;
  eiros_docker = eiros_virtualization.docker;
in
{
  options.eiros.system.virtualization.docker.enable = lib.mkOption {
    default = true;
    description = "Enable the Docker container runtime.";
    example = lib.literalExpression ''
      {
        eiros.system.virtualization.docker.enable = false;
      }
    '';
    type = lib.types.bool;
  };

  config = lib.mkIf (eiros_virtualization.enable && eiros_docker.enable) {
    virtualisation.docker.enable = true;
  };
}
