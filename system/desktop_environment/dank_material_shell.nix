{ config, lib, ... }:
let
  eiros_dms = config.eiros.system.desktop_environment.dank_material_shell;
in
{
  options.eiros.system.desktop_environment.dank_material_shell = {
    enable = lib.mkOption {
      default = true;
      description = "Enable the Eiros Dank Material Shell";
      type = lib.types.bool;
    };
    greeter.enable = lib.mkOption {
      default = true;
      description = "Enable the Eiros Dank Material Shell Greeter";
      type = lib.types.bool;
    };
  };
  config.programs.dankMaterialShell = lib.mkIf eiros_dms.enable {
    enable = true;
    greeter = lib.mkIf eiros_dms.greeter.enable {
      enable = true;
      compositor.name = "mangowc";
    };
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
  };
}
