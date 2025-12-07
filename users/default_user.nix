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
          spotlight = lib.mkIf config.eiros.system.desktop_environment.dank_material_shell.enable {
            key_symbol = "SUPER";
            flag_modifiers = [ "r" ];
            mangowc_command = "spawn_shell";
            command_arguments = "dms ipc call spotlight toggle";
          };
          close_window = {
            modifier_keys = [ "SUPER" ];
            key_symbol = "q";
            mangowc_command = "killclient";
          };
          quit = {
            modifier_keys = [
              "SUPER"
              "SHIFT"
            ];
            key_symbol = "q";
            mangowc_command = "quit";
          };
          terminal = {
            modifier_keys = [ "SUPER" ];
            key_symbol = "t";
            mangowc_command = "spawn";
            command_arguments = "warp-terminal";
          };
        };
      };
    };
  };
}
