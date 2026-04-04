{ config, lib, pkgs, ... }:
let
  eiros_printing = config.eiros.system.hardware.printing;
  eiros_scanning = config.eiros.system.hardware.scanning;
in
{
  options.eiros.system.hardware.printing = {
    enable = lib.mkOption {
      default = false;
      description = "Enable CUPS printing support.";
      type = lib.types.bool;
    };

    drivers = lib.mkOption {
      default = [ ];
      description = "CUPS driver packages to install (e.g. pkgs.hplip, pkgs.gutenprint).";
      type = lib.types.listOf lib.types.package;
    };

    discovery.enable = lib.mkOption {
      default = true;
      description = "Enable Avahi mDNS-based network printer discovery.";
      type = lib.types.bool;
    };
  };

  options.eiros.system.hardware.scanning = {
    enable = lib.mkOption {
      default = false;
      description = "Enable scanner support via SANE.";
      type = lib.types.bool;
    };

    airscan.enable = lib.mkOption {
      default = true;
      description = "Enable sane-airscan for network scanner discovery (eSCL/WSD protocol).";
      type = lib.types.bool;
    };

    extra_backends = lib.mkOption {
      default = [ ];
      description = "Additional SANE backend packages (e.g. pkgs.hplipWithPlugin for HP scanners).";
      type = lib.types.listOf lib.types.package;
    };
  };

  config = lib.mkMerge [
    (lib.mkIf eiros_printing.enable {
      services.printing = {
        enable = true;
        drivers = eiros_printing.drivers;
      };

      services.avahi = lib.mkIf eiros_printing.discovery.enable {
        enable = true;
        nssmdns4 = true;
      };
    })

    (lib.mkIf eiros_scanning.enable {
      hardware.sane = {
        enable = true;
        extraBackends =
          lib.optionals eiros_scanning.airscan.enable [ pkgs.sane-airscan ]
          ++ eiros_scanning.extra_backends;
      };
    })
  ];
}
