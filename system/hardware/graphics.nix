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
  };
  config.hardware.graphics = lib.mkIf eiros_graphics.enable {
    enable = true;
  };
}
