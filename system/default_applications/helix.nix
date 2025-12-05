{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_helix = config.eiros.system.default_applications.helix;
in
{
  options.eiros.system.default_applications.helix.enable = {
    default = true;
    description = "Enables helix (https://helix-editor.com/)";
    type = lib.types.bool;
  };
  config = lib.mkIf eiros_helix.enable {
    environment.systemPackages = [ pkgs.helix ];
  };
}
