# Mounts /tmp as a RAM-backed tmpfs to speed up build artifacts and reduce NVMe wear.
{ config, lib, ... }:
let
  eiros_tmp = config.eiros.system.boot.tmp;
in
{
  options.eiros.system.boot.tmp = {
    use_tmpfs = lib.mkOption {
      default = true;
      description = "Mount /tmp as a tmpfs (RAM-backed). Faster for build artifacts and avoids unnecessary NVMe write wear.";
      example = lib.literalExpression ''
        {
          eiros.system.boot.tmp.use_tmpfs = false;
        }
      '';
      type = lib.types.bool;
    };

    size = lib.mkOption {
      default = "20%";
      description = "Maximum size of the tmpfs /tmp as a percentage of RAM or a fixed size (e.g. \"4G\").";
      example = lib.literalExpression ''
        {
          eiros.system.boot.tmp.size = "50%";
        }
      '';
      type = lib.types.str;
    };
  };

  config = lib.mkIf eiros_tmp.use_tmpfs {
    boot.tmp = {
      useTmpfs = true;
      tmpfsSize = eiros_tmp.size;
    };
  };
}
