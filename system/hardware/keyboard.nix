# Configures the system keyboard layout and variant via xkb.
{ config, lib, ... }:
let
  eiros_keyboard = config.eiros.system.hardware.keyboard;
in
{
  options.eiros.system.hardware.keyboard = {
    enable = lib.mkOption {
      default = true;
      description = "Configure the system keyboard layout via xkb.";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.keyboard.enable = false;
        }
      '';
      type = lib.types.bool;
    };

    layout = lib.mkOption {
      default = "us";
      description = "Keyboard layout to use (xkb-data-style).";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.keyboard.layout = "de";
        }
      '';
      type = lib.types.str;
    };

    variant = lib.mkOption {
      default = "";
      description = "Keyboard layout variant to use.";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.keyboard.variant = "nodeadkeys";
        }
      '';
      type = lib.types.str;
    };
  };

  config = lib.mkIf eiros_keyboard.enable {
    services.xserver.xkb = {
      layout = eiros_keyboard.layout;
      variant = eiros_keyboard.variant;
    };
  };
}
