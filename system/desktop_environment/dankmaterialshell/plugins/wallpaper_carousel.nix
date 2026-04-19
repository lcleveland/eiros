# wallpaperCarousel DMS plugin — interactive 3D carousel for wallpaper selection.
# Keybind (SUPER+w) is declared in default_keybinds.nix alongside other DMS binds.
{ inputs, ... }:
{
  eiros.system.desktop_environment.dankmaterialshell.plugins = {
    wallpaperCarousel = {
      enable = true;
      src = inputs.wallpaper_carousel;
    };
  };
}
