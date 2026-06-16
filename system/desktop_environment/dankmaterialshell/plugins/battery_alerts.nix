# dankBatteryAlerts DMS plugin — low/critical battery notifications. Daemon, no UI.
# Thresholds are configured in DMS Settings → Plugins.
{ inputs, ... }:
{
  eiros.system.desktop_environment.dankmaterialshell.plugins = {
    dankBatteryAlerts = {
      enable = true;
      src = "${inputs.dms_official_plugins}/DankBatteryAlerts";
    };
  };
}
