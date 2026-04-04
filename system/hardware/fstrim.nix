{ config, lib, ... }:
let
  eiros_fstrim = config.eiros.system.hardware.fstrim;
in
{
  options.eiros.system.hardware.fstrim = {
    enable = lib.mkOption {
      default = true;
      description = "Enable periodic fstrim to maintain SSD/NVMe performance and longevity.";
      type = lib.types.bool;
    };

    interval = lib.mkOption {
      default = "weekly";
      description = "systemd OnCalendar schedule for fstrim.";
      type = lib.types.str;
    };
  };

  config = lib.mkIf eiros_fstrim.enable {
    services.fstrim = {
      enable = true;
      interval = eiros_fstrim.interval;
    };
  };
}
