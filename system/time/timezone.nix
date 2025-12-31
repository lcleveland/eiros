{ config, lib, ... }:
let
  eiros_time = config.eiros.system.time;
in
{
  options.eiros.system.time = {
    time_zone = lib.mkOption {
      default = "America/Chicago";
      description = "The system time zone.";
      type = lib.types.str;
    };

    timesync.enable = lib.mkOption {
      default = true;
      description = "Enable time synchronization (systemd-timesyncd).";
      type = lib.types.bool;
    };
  };

  config = {
    time.timeZone = eiros_time.time_zone;

    services.timesyncd.enable = eiros_time.timesync.enable;
  };
}
