{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_fingerprint_scanner = config.eiros.system.hardware.fingerprint_scanner;
in
{
  options.eiros.system.hardware.fingerprint_scanner = {
    enable = lib.mkOption {
      default = true;
      description = "Enable Eiros hardware fingerprint scanner support.";
      type = lib.types.bool;
    };
  };
  config.services.fprintd.enable = eiros_fingerprint_scanner.enable;
}
