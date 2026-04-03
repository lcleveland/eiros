{ config, lib, ... }:
let
  eiros_io = config.eiros.system.hardware.io_scheduler;
in
{
  options.eiros.system.hardware.io_scheduler.enable = lib.mkOption {
    default = true;
    description = "Set I/O schedulers per device type via udev (NVMe=none, SSD=mq-deadline, HDD=bfq).";
    type = lib.types.bool;
  };

  config = lib.mkIf eiros_io.enable {
    services.udev.extraRules = ''
      # NVMe: no scheduler — the drive manages its own queue.
      ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/scheduler}="none"

      # SATA SSD: mq-deadline — low latency with bounded wait times.
      ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="mq-deadline"

      # HDD: bfq — fair queuing optimised for rotational media.
      ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="bfq"
    '';
  };
}
