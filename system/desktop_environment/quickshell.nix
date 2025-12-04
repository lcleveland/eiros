{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_quickshell = config.eiros.system.desktop_environment.quickshell;
in
{
  options.eiros.system.desktop_environment.quickshell = {
    enable = lib.mkOption {
      default = true;
      description = "Enable the quickshell";
      type = lib.types.bool;
    };
  };
  config = lib.mkIf eiros_quickshell.enable {
    environment.systemPackages = [ pkgs.quickshell ];
  };
}
