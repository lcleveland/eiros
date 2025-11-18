{ config, lib, ... }:
{
  options.eiros.system.time.time_zone = lib.mkOption {
    type = lib.types.str;
    default = "America/Chicago";
    description = "The time zone in the system.";
  };
  config.time.timeZone = config.eiros.system.time.time_zone;
}
