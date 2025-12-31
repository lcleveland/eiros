{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_dms = config.eiros.system.desktop_environment.dank_material_shell;

  hypr_value_type = lib.types.either lib.types.str (lib.types.listOf lib.types.str);

  to_non_empty_list =
    v:
    let
      list = if lib.isList v then v else [ v ];
    in
    lib.filter (s: s != "") (map toString list);

  render_hypr_config =
    sections:
    let
      render_kv_lines =
        kv:
        let
          pairs = lib.concatLists (
            lib.mapAttrsToList (
              k: v:
              let
                values = to_non_empty_list v;
              in
              map (vv: "${k} = ${vv}") values
            ) kv
          );
        in
        lib.concatStringsSep "\n" pairs;

      indent_lines = s: lib.concatStringsSep "\n" (map (l: "  " + l) (lib.splitString "\n" s));

      render_section =
        section_name: kv:
        let
          body = render_kv_lines kv;
        in
        if body == "" then
          ""
        else if section_name == "" || section_name == null then
          body
        else
          ''
            ${section_name} {
            ${indent_lines body}
            }
          '';
    in
    lib.concatStringsSep "\n\n" (lib.filter (s: s != "") (lib.mapAttrsToList render_section sections));

  start_hyprland = pkgs.writeShellScriptBin "start-hyprland" ''
    #!/usr/bin/env bash
    set -euo pipefail

    # dms-greeter invokes: start-hyprland -- --config /path/to/config
    if [[ "''${1:-}" == "--" ]]; then shift; fi

    exec ${pkgs.dbus}/bin/dbus-run-session ${pkgs.hyprland}/bin/Hyprland "$@"
  '';

  greeter_hypr_config = render_hypr_config eiros_dms.greeter.hyprland.sections;
in
{
  options.eiros.system.desktop_environment.dank_material_shell = {
    enable = lib.mkOption {
      default = true;
      description = "Enable the Eiros Dank Material Shell";
      type = lib.types.bool;
    };

    greeter = {
      enable = lib.mkOption {
        default = true;
        description = "Enable the Eiros Dank Material Shell Greeter";
        type = lib.types.bool;
      };

      hyprland = {
        sections = lib.mkOption {
          default = { };
          description = ''
            Hyprland config sections for the greeter.

            Each section is an attrset of keys to either:
              - a string (single line)
              - a list of strings (repeated key lines)

            Special section name "":
              - renders top-level lines (no section wrapper)
          '';
          example = {
            input = {
              kb_layout = "us";
              kb_options = [
                "caps:escape"
                "compose:ralt"
              ];
              kb_variant = "dvorak";
            };

            "" = {
              monitor = [
                ",preferred,auto,1"
                "HDMI-A-1,preferred,auto,1"
              ];
              exec-once = [
                "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
                "dunst"
              ];
              bind = [
                "SUPER,Return,exec,kitty"
                "SUPER,Q,killactive,"
              ];
            };
          };
          type = lib.types.attrsOf (lib.types.attrsOf hypr_value_type);
        };
      };

      logs = {
        enable = lib.mkOption {
          default = true;
          description = "Enable logging of greeter messages to a file";
          type = lib.types.bool;
        };

        path = lib.mkOption {
          default = "/tmp/dms-greeter.log";
          description = "Path for the greeter log file.";
          type = lib.types.str;
        };
      };
    };
  };

  config = {
    assertions = [
      {
        assertion = !eiros_dms.enable || !eiros_dms.greeter.enable || greeter_hypr_config != "";
        message = "dank-material-shell greeter is enabled but no Hyprland config was rendered; set eiros.system.desktop_environment.dank_material_shell.greeter.hyprland.sections.";
      }
    ];

    environment = {
      systemPackages = lib.optionals (eiros_dms.enable && eiros_dms.greeter.enable) [
        pkgs.dbus
        start_hyprland
      ];
    };

    programs = {
      dank-material-shell = lib.mkIf eiros_dms.enable {
        enable = true;

        greeter = lib.mkIf eiros_dms.greeter.enable {
          enable = true;

          logs = lib.mkIf eiros_dms.greeter.logs.enable {
            path = eiros_dms.greeter.logs.path;
            save = true;
          };

          compositor = {
            name = "hyprland";
            customConfig = greeter_hypr_config;
          };
        };

        systemd = {
          enable = true;
          restartIfChanged = true;
        };
      };
    };
  };
}
