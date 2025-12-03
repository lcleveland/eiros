{
  config,
  lib,
  ...
}:
{
  options.eiros.default_user = {
    enable = lib.mkOption {
      description = "Enable the default Eiros user";
      default = true;
      type = lib.types.bool;
    };
  };
  config = lib.mkIf config.eiros.default_user.enable {
    eiros.users.eiros = {

    };
  };
}
