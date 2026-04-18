# Configures zram compressed swap to reduce disk I/O under memory pressure.
{ config, lib, ... }:
let
  eiros_zram = config.eiros.system.hardware.zram;
in
{
  options.eiros.system.hardware.zram = {
    enable = lib.mkOption {
      default = true;
      description = "Enable zram compressed swap to avoid disk swapping under memory pressure.";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.zram.enable = false;
        }
      '';
      type = lib.types.bool;
    };

    algorithm = lib.mkOption {
      default = "zstd";
      description = "Compression algorithm. zstd offers better compression ratio; lz4 is faster with less CPU overhead.";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.zram.algorithm = "lz4";
        }
      '';
      type = lib.types.str;
    };

    memory_percent = lib.mkOption {
      default = 50;
      description = "Percentage of total RAM to allocate as zram swap capacity (default: 50%).";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.zram.memory_percent = 25;
        }
      '';
      type = lib.types.int;
    };
  };

  config = lib.mkIf eiros_zram.enable {
    zramSwap = {
      enable = true;
      priority = 100;
      algorithm = eiros_zram.algorithm;
      memoryPercent = eiros_zram.memory_percent;
    };
  };
}
