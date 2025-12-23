{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_mangowc = config.eiros.system.desktop_environment.mangowc;
  mangoPkg = config.programs.mango.package;
in
{
  options.eiros.system.desktop_environment.mangowc.enable = lib.mkOption {
    description = "Enables the Mango Window Composer.";
    default = true;
    type = lib.types.bool;
  };

  config = lib.mkIf eiros_mangowc.enable {
    programs.mango.enable = true;

    # Ensure DM/greeters can discover session .desktop shipped by mangoPkg
    services.displayManager.sessionPackages = [ mangoPkg ];

    # Optional but helps ensure the package’s share/ data is in the system profile
    environment.systemPackages = [ mangoPkg ];
  };
}
