{
  config,
  lib,
  pkgs,
  ...
}:

let
  eiros_flatpak = config.eiros.system.default_applications.flatpak;

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
      description = "Install KDE Discover for managing Flatpak applications.";
    };
  };

  config = lib.mkIf eiros_flatpak.enable {

    warnings = lib.optional (eiros_flatpak.discover && discoverPkg == null)
      "eiros: flatpak.discover = true but no Discover package found in pkgs";

    services.flatpak.enable = true;

    # Discover support
    services.packagekit.enable = lib.mkIf eiros_flatpak.discover true;

    environment.systemPackages = lib.optionals eiros_flatpak.discover (
      lib.optionals (discoverPkg != null) [ discoverPkg ]
    );

    # Flathub remote (exact method from NixOS documentation)
    systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];

      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];

      path = [ pkgs.flatpak ];

      script = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
    };

  };
}
