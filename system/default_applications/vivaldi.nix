{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_vivaldi = config.eiros.system.default_applications.vivaldi;
in
{
  options.eiros.system.default_applications.vivaldi.enable = lib.mkOption {
    default = true;
    description = "Enable vivaldi as the default browser.";
    type = lib.types.bool;
  };
  config.environment.systemPackages = lib.mkIf eiros_vivaldi.enable [ pkgs.vivaldi ];
}
