{ config, lib, ... }:
let
  eiros_keyring = config.eiros.system.desktop_environment.keyring;
in
{
  options.eiros.system.desktop_environment.keyring = {
    enable = lib.mkOption {
      default = true;
      description = "Enable Gnome keyring";
      type = lib.types.bool;
    };
  };
  config = lib.mkIf eiros_keyring.enable {
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.greetd.enableGnomeKeyring = true;
    security.pam.services.login.enableGnomeKeyring = true;
    programs.seahorse.enable = true;
    programs.ssh.startAgent = false;
  };
}
