{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_ghostty = config.eiros.system.default_applications.ghostty;
in
{
  options.eiros.system.default_applications.ghostty = {
    enable = lib.mkOption {
      default = true;
      description = "Enable Ghostty terminal";
      type = lib.types.bool;
    };

    package = lib.mkOption {
      default = pkgs.ghostty;
      description = "Ghostty package to install.";
      type = lib.types.package;
    };
  };

  config.environment.systemPackages = lib.mkIf eiros_ghostty.enable [ eiros_ghostty.package ];
}
