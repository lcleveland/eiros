# Enables Stylix for system-wide theming derived from a wallpaper image.
{ config, lib, ... }:
let
  eiros_stylix = config.eiros.system.desktop_environment.stylix;
in
{
  options.eiros.system.desktop_environment.stylix = {
    enable = lib.mkOption {
      default = false;
      description = "Enable Stylix for system-wide theming. Generates a color scheme from a wallpaper and applies it to GTK, Qt, terminals, and more. Requires stylix.image to be set.";
      example = lib.literalExpression ''
        {
          eiros.system.desktop_environment.stylix.enable = true;
          eiros.system.desktop_environment.stylix.image = ./wallpaper.jpg;
        }
      '';
      type = lib.types.bool;
    };

    image = lib.mkOption {
      default = null;
      description = "Path to the wallpaper image used to generate the color scheme. Required when enable = true.";
      example = lib.literalExpression "./wallpaper.jpg";
      type = lib.types.nullOr lib.types.path;
    };

    polarity = lib.mkOption {
      default = "dark";
      description = "Whether to generate a dark or light color scheme from the wallpaper. Options: \"dark\", \"light\", \"either\".";
      example = lib.literalExpression ''"light"'';
      type = lib.types.enum [ "dark" "light" "either" ];
    };
  };

  config = lib.mkIf eiros_stylix.enable {
    assertions = [
      {
        assertion = eiros_stylix.image != null;
        message = "eiros.system.desktop_environment.stylix.enable is true but no image is set. Set eiros.system.desktop_environment.stylix.image to a wallpaper path.";
      }
    ];

    stylix = {
      enable = true;
      image = eiros_stylix.image;
      polarity = eiros_stylix.polarity;
    };
  };
}
