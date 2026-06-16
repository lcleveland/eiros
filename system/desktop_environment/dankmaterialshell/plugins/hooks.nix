# dankHooks DMS plugin — run custom scripts on system events
# (onWallpaperChanged, onVolumeChanged, theme/battery changes). Daemon, no UI.
# Hook scripts are configured in DMS Settings → Plugins.
{ inputs, ... }:
{
  eiros.system.desktop_environment.dankmaterialshell.plugins = {
    dankHooks = {
      enable = true;
      src = "${inputs.dms_official_plugins}/DankHooks";
    };
  };
}
