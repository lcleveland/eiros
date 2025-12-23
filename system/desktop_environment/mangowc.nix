{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_mangowc = config.eiros.system.desktop_environment.mangowc;

  # Prefer the package exposed by the mango nixos module you import via inputs.mango.nixosModules.mango
  mango_pkg =
    if config.programs ? mango && config.programs.mango ? package then
      config.programs.mango.package
    else
      null;

  # Resolve the exec command without hard-coding pkgs.mangowc.
  # If the module exposes a package, use its /bin/mango.
  # Otherwise, rely on PATH at runtime (works if programs.mango installs mango into the system profile).
  mango_exec = if mango_pkg != null then "${mango_pkg}/bin/mango" else "mango";

  mango_session = pkgs.runCommand "mango-session" { } ''
        mkdir -p $out/share/wayland-sessions
        cat > $out/share/wayland-sessions/mango.desktop <<EOF
    [Desktop Entry]
    Name=MangoWC
    Comment=Wayland compositor
    Exec=${mango_exec}
    Type=Application
    EOF
  '';
in
{
  options.eiros.system.desktop_environment.mangowc.enable = lib.mkOption {
    description = "Enables the Mango Window Composer.";
    default = true;
    type = lib.types.bool;
  };

  config = lib.mkIf eiros_mangowc.enable {
    # provided by inputs.mango.nixosModules.mango
    programs.mango.enable = true;

    # this is what greeters enumerate
    services.displayManager.sessionPackages = [
      mango_session
    ];
  };
}
