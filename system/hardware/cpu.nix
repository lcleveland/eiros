{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_cpu = config.eiros.system.hardware.cpu;

  detected_vendor =
    let
      vendor = lib.toLower (pkgs.stdenv.hostPlatform.parsed.cpu.vendor or "");
    in
    if
      lib.elem vendor [
        "amd"
        "intel"
      ]
    then
      vendor
    else
      null;

  effective_vendor = if eiros_cpu.vendor != null then eiros_cpu.vendor else detected_vendor;
in
{
  options.eiros.system.hardware.cpu = {
    microcode.enable = lib.mkOption {
      default = true;
      description = "Enable CPU microcode updates.";
      type = lib.types.bool;
    };

    vendor = lib.mkOption {
      default = null;
      description = "CPU vendor. If null, auto-detect from hostPlatform.";
      type = lib.types.nullOr (
        lib.types.enum [
          "amd"
          "intel"
        ]
      );
    };
  };

  config = {
    assertions = [
      {
        assertion = effective_vendor != null;
        message = "Unable to auto-detect CPU vendor; set eiros.system.hardware.cpu.vendor to \"amd\" or \"intel\".";
      }
    ];

    hardware = {
      cpu = {
        ${effective_vendor}.updateMicrocode = eiros_cpu.microcode.enable;
      };
    };
  };
}
