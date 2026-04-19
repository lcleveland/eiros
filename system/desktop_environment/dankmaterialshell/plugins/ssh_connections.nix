# sshConnections DMS plugin — SSH to configured servers from the Launcher (trigger: ;).
{ inputs, ... }:
{
  eiros.system.desktop_environment.dankmaterialshell.plugins = {
    sshConnections = {
      enable = true;
      src = "${inputs.dms_ssh_connections}/sshConnections";
    };
  };

  eiros.system.user_defaults.dms.misc.external_plugin_settings = {
    sshConnections = {
      terminal = "ghostty";
    };
  };
}
