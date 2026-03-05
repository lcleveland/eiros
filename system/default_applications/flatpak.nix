{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.eiros.system.default_applications.flatpak;

  # Discover lives at pkgs.kdePackages.discover on most modern nixpkgs,
  # but some channels expose it as pkgs.discover.
  discoverPkg =
    if pkgs ? kdePackages && pkgs.kdePackages ? discover then
      pkgs.kdePackages.discover
    else if pkgs ? discover then
      pkgs.discover
    else
      null;
in
{
  options.eiros.system.default_applications.flatpak = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Flatpak support.";
    };

    discover = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Install KDE Discover as a GUI software center (recommended for non-GNOME).";
    };
  };

  config = lib.mkIf cfg.enable {
    services.flatpak.enable = true;

    systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
      serviceConfig.Type = "oneshot";
    };

    # GUI software center support (non-GNOME)
    services.packagekit.enable = lib.mkIf cfg.discover true;

    environment.systemPackages = lib.optionals cfg.discover (
      lib.optionals (discoverPkg != null) [ discoverPkg ]
    );
  };
}
