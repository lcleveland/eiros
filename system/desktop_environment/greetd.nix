{
  config,
  lib,
  pkgs,
  ...
}:
{
  systemd.services.greetd = {
    # Make sure /run/current-system is ready before greetd/greeter scans sessions
    after = [
      "nixos-activation.service"
      "local-fs.target"
    ];
    requires = [ "nixos-activation.service" ];
    wants = [ "nixos-activation.service" ];
  };
}
