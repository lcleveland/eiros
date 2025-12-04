{ config, lib, ... }:

let
  eiros_default_user = config.eiros.default_user;
in
{
  options.eiros.default_user = {
    enable = lib.mkOption {
      description = "Enable the default Eiros user";
      default = true;
      type = lib.types.bool;
    };
  };

  config = lib.mkIf eiros_default_user.enable {
    eiros.users.eiros = {
      mangowc = {
        keybinds = {
          quit = {
            modifier_keys = [
              "SUPER"
              "SHIFT"
            ];
            key_symbol = "q";
            mangowc_command = "quit";
          };
        };
      };
    };
  };
}
