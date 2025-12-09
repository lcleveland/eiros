{ config, lib, ... }:

let
  mangowc_generator = lib.generators.toKeyValue {
    mkKeyValue =
      name: value:
      if lib.isList value then
        lib.concatMapStringsSep "\n" (v: "${name}=${toString v}") value
      else
        "${name}=${toString value}";
  };
in
{
  options = {
    eiros.users = lib.mkOption {
      default = { };
      type = lib.types.attrsOf (
        lib.types.submodule (
          { name, ... }:
          {
            options = {
              extra_groups = lib.mkOption {
                default = [
                  "wheel"
                  "networkmanager"
                  "libvirtd"
                ];
                description = "Additional groups for the user.";
                type = lib.types.listOf lib.types.str;
              };
              initial_password = lib.mkOption {
                default = name;
                description = "Initial password for the user.";
                type = lib.types.str;
              };
              mangowc = lib.mkOption {
                type = lib.types.nullOr (
                  lib.types.submodule {
                    options = {
                      clobber_home_directory = lib.mkOption {
                        default = true;
                        description = "Whether hjem is allowed to clobber the existing home directory.";
                        type = lib.types.bool;
                      };
                      keybinds = lib.mkOption {
                        type = lib.types.attrsOf (
                          lib.types.submodule (
                            { name, ... }:
                            {
                              options = {
                                flag_modifiers = lib.mkOption {
                                  type = lib.types.listOf (
                                    lib.types.enum [
                                      "l"
                                      "r"
                                      "s"
                                    ]
                                  );
                                  default = [ ];
                                  example = [
                                    "l"
                                    "s"
                                  ];
                                  description = ''
                                    MangoWC bind flags:
                                    l (lock), r (release), s (keysym).
                                  '';
                                };
                                key_symbol = lib.mkOption {
                                  type = lib.types.str;
                                  description = "Key symbol such as \"Return\", \"Q\", or \"space\".";
                                };
                                modifier_keys = lib.mkOption {
                                  type = lib.types.listOf lib.types.str;
                                  default = [ ];
                                  description = "Modifier keys joined using '+', e.g., [\"SUPER\" \"SHIFT\"].";
                                };
                                mangowc_command = lib.mkOption {
                                  type = lib.types.str;
                                  description = "MangoWC command (e.g., \"spawn\", \"killclient\", \"quit\").";
                                };
                                command_arguments = lib.mkOption {
                                  type = lib.types.nullOr lib.types.str;
                                  default = null;
                                  description = "Optional command arguments.";
                                };
                              };
                            }
                          )
                        );
                        default = { };
                        description = "Structured MangoWC keybind declarations.";
                      };
                      settings = lib.mkOption {
                        default = { };
                        description = "Raw MangoWC settings written as key=value pairs.";
                        type = lib.types.attrsOf (
                          lib.types.oneOf [
                            lib.types.str
                            lib.types.int
                            (lib.types.listOf lib.types.str)
                          ]
                        );
                      };
                    };
                  }
                );
                default = null;
                description = "Per-user MangoWC configuration (or null if unused).";
              };
            };
          }
        )
      );
      description = "Per-user configuration for the eiros system, including MangoWC and home management.";
    };
  };
  config = {
    users.users = lib.mapAttrs (username: user_config: {
      description = lib.mkDefault username;
      extraGroups = lib.mkDefault user_config.extra_groups;
      initialPassword = lib.mkDefault user_config.initial_password;
      isNormalUser = lib.mkDefault true;
    }) config.eiros.users;
    hjem.users = lib.mapAttrs (
      username: user_config:
      let
        mangowc_cfg = user_config.mangowc;
      in
      {
        user = username;
        directory = lib.mkDefault "/home/${username}";
        files = {
          ".config/mango/config.conf" =
            let
              make_bind_line =
                kb:
                let
                  modifier_keys_str = lib.concatStringsSep "+" kb.modifier_keys;
                  command_args_str = if kb.command_arguments == null then "" else kb.command_arguments;
                in
                "${modifier_keys_str},${kb.key_symbol},${kb.mangowc_command},${command_args_str}";
              extra_bind_attrs = builtins.foldl' (
                acc: kb:
                let
                  flags_str = lib.concatStrings (kb.flag_modifiers or [ ]);
                  bind_key = "bind" + flags_str;
                  line = make_bind_line kb;
                  previous = acc.${bind_key} or [ ];
                in
                acc // { ${bind_key} = previous ++ [ line ]; }
              ) { } (lib.attrValues mangowc_cfg.keybinds);
              merged_settings =
                mangowc_cfg.settings
                // lib.optionalAttrs config.eiros.system.desktop_environment.dank_material_shell.enable {
                  "exec-once" = [ "dms run" ];
                }
                // lib.mapAttrs (name: lines: (mangowc_cfg.settings.${name} or [ ]) ++ lines) extra_bind_attrs;
            in
            lib.mkIf (config.eiros.system.desktop_environment.mangowc.enable && mangowc_cfg != null) {
              generator = mangowc_generator;
              value = merged_settings;
              clobber = lib.mkDefault mangowc_cfg.clobber_home_directory;
            };
        };
      }
    ) config.eiros.users;
  };
}
