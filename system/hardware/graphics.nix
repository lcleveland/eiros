{ config, lib, ... }:
let
  eiros_graphics = config.eiros.system.hardware.graphics;
in
{
  options.eiros.system.hardware.graphics = {
    enable = lib.mkOption {
      default = true;
      description = "Enable Eiros hardware graphics.";
      type = lib.types.bool;
    };
    nvidia.enable = lib.mkOption {
      default = true;
      description = "Enable Nvidia GPU support.";
      type = lib.types.bool;
    };
  };
  config.hardware = lib.mkIf eiros_graphics.enable {
    graphics.enable = true;
    nvidia.open = eiros_graphics.nvidia.enable;
  };
}
