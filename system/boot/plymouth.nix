{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_plymouth = config.eiros.system.boot.plymouth;
in
{
  options.eiros.system.boot.plymouth = {
    enable = lib.mkOption {
      default = true;
      description = "Activate the Eiros Plymouth theme";
      type = lib.types.bool;
    };
  };
  config = lib.mkIf eiros_plymouth.enable {
    boot = {
      plymouth = {
        enable = true;
        theme = "hud 3";
      };
      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "udev.log_priority=3"
        "rd.systemd.show_status=auto"
      ];
      loader.timeout = 0;
    };
  };
}
