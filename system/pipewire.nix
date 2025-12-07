{ config, lib, ... }:
let
  eiros_pipewire = config.eiros.system.pipewire;
in
{
  options.eiros.system.pipewire = {
    enable = lib.mkOption {
      default = true;
      description = "Enable pipewire";
      type = lib.types.bool;
    };
  };
  config = lib.mkIf eiros_pipewire.enable {
    services = {
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
      pulseaudio.enable = false;
      security.rtkit.enable = true;
    };
  };
}
