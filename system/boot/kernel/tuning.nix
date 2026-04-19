# Applies kernel boot parameters and sysctl settings for CPU, VM, and I/O performance tuning.
{ config, lib, ... }:
let
  eiros_tuning = config.eiros.system.boot.kernel.tuning;
in
{
  options.eiros.system.boot.kernel.tuning = {
    enable = lib.mkOption {
      default = true;
      description = "Enable kernel parameter and sysctl performance tuning.";
      example = lib.literalExpression ''
        {
          eiros.system.boot.kernel.tuning.enable = false;
        }
      '';
      type = lib.types.bool;
    };

    kernel_params = lib.mkOption {
      default = [
        "transparent_hugepage=madvise"          # only allocate huge pages on madvise(); avoids latency spikes from background compaction
        "nvme_core.default_ps_max_latency_us=0" # disable NVMe power-state latency limits; keeps drive at full performance
        "iommu=pt"                              # IOMMU pass-through mode; required for VFIO/GPU passthrough without breaking DMA
        "threadirqs"                            # move IRQ handlers to kernel threads; improves scheduler fairness under load
      ];
      description = "Kernel parameters for performance tuning.";
      example = lib.literalExpression ''
        {
          eiros.system.boot.kernel.tuning.kernel_params = [
            "quiet"
            "mitigations=off"
          ];
        }
      '';
      type = lib.types.listOf lib.types.str;
    };

    sysctl = {
      enable = lib.mkOption {
        default = true;
        description = "Enable sysctl VM and scheduler tuning.";
        example = lib.literalExpression ''
          {
            eiros.system.boot.kernel.tuning.sysctl.enable = false;
          }
        '';
        type = lib.types.bool;
      };

      settings = lib.mkOption {
        default = {
          "vm.swappiness" = 0;                    # strongly prefer RAM over swap; only swap under extreme pressure
          "vm.vfs_cache_pressure" = 50;           # cache dentries/inodes more aggressively than the default (100)
          "vm.dirty_ratio" = 10;                  # force synchronous writeback when dirty pages exceed 10% of RAM
          "vm.dirty_background_ratio" = 5;        # start background writeback at 5% of RAM
          "vm.dirty_writeback_centisecs" = 1500;  # flush dirty pages every 15s (default 5s); batches I/O for SSDs
          "vm.oom_kill_allocating_task" = 1;      # OOM-kill the allocating task instead of a random high-score victim
          "vm.overcommit_memory" = 1;             # always allow memory allocation; avoids false OOM in JVM/game processes
          "vm.page-cluster" = 0;                  # disable swap readahead; wasteful when swappiness is near 0
          "kernel.sched_migration_cost_ns" = 5000000; # raise task migration cost to reduce cache-thrashing on desktop workloads
          "kernel.nmi_watchdog" = 0;              # disable NMI watchdog; frees an interrupt and reduces latency on desktop
        };
        description = "Sysctl settings for VM and scheduler tuning.";
        example = lib.literalExpression ''
          {
            eiros.system.boot.kernel.tuning.sysctl.settings = { "vm.swappiness" = 10; "vm.vfs_cache_pressure" = 100; };
          }
        '';
        type = lib.types.attrsOf lib.types.anything;
      };
    };
  };

  config = lib.mkIf eiros_tuning.enable {
    boot.kernelParams = eiros_tuning.kernel_params;

    boot.kernel.sysctl = lib.mkIf eiros_tuning.sysctl.enable eiros_tuning.sysctl.settings;
  };
}
