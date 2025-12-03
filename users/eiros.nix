{
  config,
  lib,
  ...
}:
let
  eiros_user = config.eiros.users.eiros;
in
{
  options.eiros.users.eiros = {
    enable = lib.mkOption {
      description = "Enable the default Eiros user";
      default = true;
      type = lib.types.bool;
    };
  };
  config = lib.mkIf eiros_user.enable {
    #    eiros.users.default_user_list = [ "eiros" ];
    users.users.eiros = {
      description = "Eiros";
    };
  };
}
