{
  config,
  lib,
  ...
}:
let
  eiros_user = config.eiros.user.eiros;
in
{
  options.eiros.user.eiros = {
    enable = lib.mkOption {
      description = "Enable the default Eiros user";
      default = true;
      type = lib.types.bool;
    };
  };
  config = lib.mkIf eiros_user.enable {
    users.users.eiros = {
      description = "Eiros";
    };
  };
}
