{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_mangowc = config.eiros.system.desktop_environment.mangowc;

  mango_pkg =
    if config.programs ? mango && config.programs.mango ? package then
      config.programs.mango.package
    else
      null;

  mango_exec = if mango_pkg != null then "${mango_pkg}/bin/mango" else "mango";

  mango_session_name = "mango";

  mango_session = pkgs.stdenvNoCC.mkDerivation {
    pname = "mango-session";
    version = "1";

    dontUnpack = true;

    installPhase = ''
            mkdir -p $out/share/wayland-sessions
            cat > $out/share/wayland-sessions/${mango_session_name}.desktop <<EOF
      [Desktop Entry]
      Name=MangoWC
      Comment=Wayland compositor
      Exec=${mango_exec}
      Type=Application
      EOF
    '';

    passthru.providedSessions = [ mango_session_name ];
  };
in
{
  options.eiros.system.desktop_environment.mangowc.enable = lib.mkOption {
    description = "Enables the Mango Window Composer.";
    default = true;
    type = lib.types.bool;
  };

  config = lib.mkIf eiros_mangowc.enable {
    programs.mango.enable = true;
    systemd.services.greetd.serviceConfig = {
      Environment = [
        "XDG_DATA_DIRS=/run/current-system/sw/share:/usr/share"
      ];
    };
    # required for greeters to list it
    services.displayManager.sessionPackages = [
      mango_session
    ];
  };
}
