{
  config,
  lib,
  ...
}:
{
  options.eiros.users.eiros = {
    enable = lib.mkOption {
      description = "Enable the default Eiros user";
      default = true;
      type = lib.types.bool;
    };
  };
  config = lib.mkIf eiros_user.enable {
    eiros.users.eiros = {

    };
  };
}
