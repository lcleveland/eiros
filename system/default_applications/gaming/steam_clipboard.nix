# Injects wl-clipboard-x11 and xdotool into Steam's FHS container so Proton
# games can access the Wayland clipboard via XWayland clipboard atoms.
# The actual Wayland↔X11 bridge daemons live in clipboard_bridge.nix.
{ config, lib, pkgs, ... }:
let
  eiros_steam_clipboard = config.eiros.system.default_applications.gaming.steam_clipboard;
in
{
  options.eiros.system.default_applications.gaming.steam_clipboard.enable = lib.mkOption {
    default = true;
    description = "Inject wl-clipboard-x11 and xdotool into Steam's FHS container for Proton game clipboard access. The Wayland↔X11 bridge daemons are managed separately by the clipboard_bridge module.";
    example = lib.literalExpression ''
      {
        eiros.system.default_applications.gaming.steam_clipboard.enable = false;
      }
    '';
    type = lib.types.bool;
  };

  config = lib.mkIf (eiros_steam_clipboard.enable && config.programs.steam.enable) {
    programs.steam.extraPackages = with pkgs; [
      wl-clipboard-x11
      xdotool
    ];
  };
}
