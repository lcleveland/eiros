{
  config,
  lib,
  pkgs,
  ...
}:
{
  config.systemd.services.greetd = {
    # Nudge ordering, but don't hard-require activation units (can prevent greetd from starting).
    after = lib.mkAfter [
      "local-fs.target"
      "systemd-user-sessions.service"
      "nixos-activation.service"
    ];

    wants = lib.mkAfter [
      "systemd-user-sessions.service"
      "nixos-activation.service"
    ];

    # Fix cold-boot race: wait briefly for the session dir to exist, but never fail the unit.
    serviceConfig.ExecStartPre = lib.mkBefore [
      "${pkgs.bash}/bin/bash -lc 'for i in $(seq 1 50); do if [ -d /run/current-system/sw/share/wayland-sessions ]; then exit 0; fi; sleep 0.1; done; exit 0'"
    ];
  };
}
