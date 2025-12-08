{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_qutebrowser = config.eiros.system.default_applications.qutebrowser;
in
{
  options.eiros.system.default_applications.qutebrowser.enable = lib.mkOption {
    default = true;
    description = "Enable qutebrowser as the default browser.";
    type = lib.types.bool;
  };
  config.environment.systemPackages = lib.mkIf eiros_qutebrowser.enable [ pkgs.qutebrowser ];
}
