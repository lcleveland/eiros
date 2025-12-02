{ lib, ... }:
{
  config._module.args.make_base_user =
    {
      username,
      name ? username,
      initial_password ? username,
      extra ? { },
    }:
    lib.mkMerge [
      {
        hjem.users.${username} = {

        };
      }
      extra
    ];
}
