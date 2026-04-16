# Enables the Polkit authorization framework for privileged D-Bus actions.
{ config, lib, ... }:
let
  eiros_polkit = config.eiros.system.security.polkit;
in
{
  options.eiros.system.security.polkit = {
    enable = lib.mkOption {
      default = true;
      description = "Enable Polkit.";
      example = lib.literalExpression ''
        {
          eiros.system.security.polkit.enable = false;
        }
      '';
      type = lib.types.bool;
    };
  };

  config.security.polkit.enable = eiros_polkit.enable;
}
