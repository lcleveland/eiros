{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_kernel = config.eiros.system.boot.kernel;
in
{
  options.eiros.system.boot.kernel.kernel_package = lib.mkOption {
    type = lib.types.attrs;
    default = pkgs.linuxPackages_latest;
    description = "The kernel package to use for Eiros.";
  };
  config.boot.kernelPackages = eiros_kernel.kernel_package;
}
