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
        theme = "hud3";
        themePackages = with pkgs; [ adi1090x-plymouth-themes ];
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
