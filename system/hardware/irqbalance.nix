# Enables irqbalance to distribute hardware IRQs across CPU cores.
{ config, lib, ... }:
let
  eiros_irqbalance = config.eiros.system.hardware.irqbalance;
in
{
  options.eiros.system.hardware.irqbalance.enable = lib.mkOption {
    default = true;
    description = "Distribute hardware IRQs across CPU cores to reduce bottlenecks from NVIDIA and NVMe interrupt load.";
    example = lib.literalExpression ''
      {
        eiros.system.hardware.irqbalance.enable = false;
      }
    '';
    type = lib.types.bool;
  };

  config = lib.mkIf eiros_irqbalance.enable {
    services.irqbalance.enable = true;
  };
}
