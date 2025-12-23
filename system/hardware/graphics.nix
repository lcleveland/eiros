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
  config = lib.mkIf eiros_graphics.enable {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = lib.mkIf eiros_graphics.nvidia.enable [ "nvidia" ];
    hardware.nvidia = lib.mkIf eiros_graphics.nvidia.enable {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    };
  };
}
