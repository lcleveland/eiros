{
  config,
  lib,
  make_base_user,
  ...
}:
let
  eiros_desktop_environment = config.eiros.system.desktop_environment;
in
{
  config._module.args.make_user =
    {
      username,
      name ? username,
      extra ? { },
    }:
    lib.mkMerge [
      {
        hjem.users.${username} = {
          directory = "/home/${username}";
          user = username;
        };
        users.users.${username} = {
          description = name;
          extraGroups = [
            "wheel"
            "networkmanager"
          ];
          initialPassword = config.eiros.system.user.initial_password;
          isNormalUser = true;
        };
      }
      extra
    ];
}
