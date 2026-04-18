# Configures TCP BBR congestion control, fair queuing, and network buffer tuning for improved throughput.
{ config, lib, ... }:
let
  eiros_perf = config.eiros.system.networking.performance;
in
{
  options.eiros.system.networking.performance = {
    enable = lib.mkOption {
      default = true;
      description = "Enable TCP BBR congestion control, fair queuing, and network buffer tuning.";
      example = lib.literalExpression ''
        {
          eiros.system.networking.performance.enable = false;
        }
      '';
      type = lib.types.bool;
    };

    tcp_fastopen = lib.mkOption {
      default = 3;
      description = "TCP Fast Open mode. 1 = client only, 2 = server only, 3 = both. Reduces handshake RTT for repeat connections.";
      example = lib.literalExpression ''
        {
          eiros.system.networking.performance.tcp_fastopen = 0;
        }
      '';
      type = lib.types.int;
    };

    rmem_max = lib.mkOption {
      default = 134217728;
      description = "Maximum receive socket buffer size in bytes (default: 128 MiB).";
      example = lib.literalExpression ''
        {
          eiros.system.networking.performance.rmem_max = 67108864;
        }
      '';
      type = lib.types.int;
    };

    wmem_max = lib.mkOption {
      default = 134217728;
      description = "Maximum send socket buffer size in bytes (default: 128 MiB).";
      example = lib.literalExpression ''
        {
          eiros.system.networking.performance.wmem_max = 67108864;
        }
      '';
      type = lib.types.int;
    };
  };

  config = lib.mkIf eiros_perf.enable {
    boot = {
      kernelModules = [ "tcp_bbr" ];

      kernel.sysctl = {
        "net.ipv4.tcp_congestion_control" = "bbr";
        "net.core.default_qdisc" = "fq";
        "net.core.rmem_max" = eiros_perf.rmem_max;
        "net.core.wmem_max" = eiros_perf.wmem_max;
        "net.ipv4.tcp_rmem" = "4096 262144 ${toString eiros_perf.rmem_max}";
        "net.ipv4.tcp_wmem" = "4096 262144 ${toString eiros_perf.wmem_max}";
        "net.ipv4.tcp_fastopen" = eiros_perf.tcp_fastopen;
        "net.core.netdev_max_backlog" = 16384;
        "net.ipv4.tcp_slow_start_after_idle" = 0;
        "net.ipv4.tcp_mtu_probing" = 1;
      };
    };
  };
}
