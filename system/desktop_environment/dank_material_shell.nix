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
  };
  config.programs.dankMaterialShell = lib.mkIf eiros_dms.enable {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
  };
}
