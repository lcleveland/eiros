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
  options.eiros.system.default_applications.vivaldi = {
    desktop_file = lib.mkOption {
      default = "vivaldi.desktop";
      description = "Desktop file used for default browser associations.";
      type = lib.types.str;
    };

    enable = lib.mkOption {
      default = true;
      description = "Enable Vivaldi as the default browser.";
      type = lib.types.bool;
    };

    package = lib.mkOption {
      default = pkgs.vivaldi;
      description = "Vivaldi package to install.";
      type = lib.types.package;
    };
  };

  config = lib.mkIf eiros_vivaldi.enable {
    assertions = [
      {
        assertion = config.nixpkgs.config.allowUnfree or false;
        message = "Vivaldi requires nixpkgs.config.allowUnfree = true.";
      }
    ];

    environment = {
      systemPackages = [ eiros_vivaldi.package ];
    };

    xdg = {
      mime = {
        defaultApplications = {
          "text/html" = [ eiros_vivaldi.desktop_file ];
          "x-scheme-handler/http" = [ eiros_vivaldi.desktop_file ];
          "x-scheme-handler/https" = [ eiros_vivaldi.desktop_file ];
        };
      };
    };
  };
}
