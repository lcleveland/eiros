{ config, lib, ... }:
let
  eiros_cpu = config.eiros.system.hardware.cpu;

  vendor_is_set = eiros_cpu.vendor != null;
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
      description = "CPU vendor. If null, enable microcode updates for both AMD and Intel.";
      type = lib.types.nullOr (
        lib.types.enum [
          "amd"
          "intel"
        ]
      );
    };
  };

  config = {
    warnings = lib.optionals (eiros_cpu.microcode.enable && !vendor_is_set) [
      "eiros.system.hardware.cpu.vendor is null; enabling microcode updates for both AMD and Intel."
    ];

    hardware = {
      cpu = lib.mkMerge [
        (lib.mkIf (eiros_cpu.vendor == "amd" || !vendor_is_set) {
          amd = {
            updateMicrocode = eiros_cpu.microcode.enable;
          };
        })

        (lib.mkIf (eiros_cpu.vendor == "intel" || !vendor_is_set) {
          intel = {
            updateMicrocode = eiros_cpu.microcode.enable;
          };
        })
      ];
    };
  };
}
