{ config, lib, ... }:
let
  eiros_tuning = config.eiros.system.boot.kernel.tuning;
in
{
  options.eiros.system.boot.kernel.tuning = {
    enable = lib.mkOption {
      default = true;
      description = "Enable kernel parameter and sysctl performance tuning.";
      type = lib.types.bool;
    };

    sysctl.enable = lib.mkOption {
      default = true;
      description = "Enable sysctl VM and scheduler tuning.";
      type = lib.types.bool;
    };
  };

  config = lib.mkIf eiros_tuning.enable {
    boot.kernelParams = [
      # THP: only grant hugepages to apps that explicitly request them
      # (QEMU does; the Wayland compositor does not — avoids compaction stalls).
      "transparent_hugepage=madvise"

      # Disable APST autonomous power state transitions on NVMe.
      # Prevents 30–100 ms latency spikes when the drive wakes from low-power state.
      "nvme_core.default_ps_max_latency_us=0"

      # IOMMU passthrough: reduces overhead for KVM guest DMA operations.
      "iommu=pt"

      # Move interrupt handling into kernel threads — improves compositor
      # frame timing by reducing hardirq latency under load.
      "threadirqs"
    ];

    boot.kernel.sysctl = lib.mkIf eiros_tuning.sysctl.enable {
      # No swap — prevent the kernel from reclaiming anonymous memory.
      "vm.swappiness" = 0;

      # Reduce VFS cache reclaim aggressiveness; lowers desktop latency spikes.
      "vm.vfs_cache_pressure" = 50;

      # Allow more dirty pages before forcing synchronous writeback.
      "vm.dirty_ratio" = 10;
      "vm.dirty_background_ratio" = 5;

      # Reduce periodic writeback wakeup frequency (good for NVMe).
      "vm.dirty_writeback_centisecs" = 1500;

      # On OOM, kill the allocating task immediately rather than thrashing.
      "vm.oom_kill_allocating_task" = 1;

      # Reduce task migration cost — improves Wayland compositor frame timing.
      "kernel.sched_migration_cost_ns" = 5000000;

      # Disable NMI watchdog to reduce unnecessary timer interrupts.
      "kernel.nmi_watchdog" = 0;
    };
  };
}
