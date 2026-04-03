{ config, lib, ... }:
let
  eiros_fingerprint = config.eiros.system.hardware.fingerprint_scanner;
in
{
  options.eiros.system.hardware.fingerprint_scanner = {
    enable = lib.mkOption {
      default = false;
      description = "Enable fingerprint scanner support via fprintd.";
      type = lib.types.bool;
    };

    pam_services = lib.mkOption {
      default = [
        "greetd"
        "login"
        "sudo"
      ];
      description = "PAM services to enable fingerprint authentication for.";
      type = lib.types.listOf lib.types.str;
    };
  };

  config = lib.mkIf eiros_fingerprint.enable {
    services.fprintd.enable = true;

    security.pam.services = builtins.listToAttrs (
      map (service_name: {
        name = service_name;
        value.fprintd = true;
      }) eiros_fingerprint.pam_services
    );
  };
}
