{ config, lib, ... }:
let
  eiros_helix = config.eiros.system.default_applications.helix;
in
{
  options.eiros.system.default_applications.helix.enable = lib.mkOption {
    default = true;
    description = "Enables helix (https://helix-editor.com/)";
    type = lib.types.bool;
  };
  config.environment.systemPackages = lib.mkIf eiros_helix.enable [ pkgs.helix ];
}
