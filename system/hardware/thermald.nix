# Enables thermald, Intel's thermal management daemon, to prevent CPU throttling and overheating.
{ config, lib, ... }:
let
  eiros_thermald = config.eiros.system.hardware.thermald;
in
{
  options.eiros.system.hardware.thermald = {
    enable = lib.mkOption {
      default = config.eiros.system.hardware.cpu.vendor == "intel";
      description = ''
        Enable thermald, the Intel thermal management daemon. Proactively manages CPU
        temperature to prevent throttling and overheating. Intel CPUs only; auto-enabled
        when eiros.system.hardware.cpu.vendor is "intel". Does not conflict with the
        schedutil governor or power-profiles-daemon.
      '';
      example = lib.literalExpression ''
        {
          eiros.system.hardware.thermald.enable = true;
        }
      '';
      type = lib.types.bool;
    };
  };

  config = lib.mkIf eiros_thermald.enable {
    services.thermald.enable = true;
  };
}
