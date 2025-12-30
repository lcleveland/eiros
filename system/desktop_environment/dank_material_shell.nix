{ config, lib, ... }:
let
  eiros_dms = config.eiros.system.desktop_environment.dank_material_shell;
  hypr_value_type = lib.types.either lib.types.str (lib.types.listOf lib.types.str);
  to_non_empty_list =
    v:
    let
      lst = if lib.isList v then v else [ v ];
    in
    lib.filter (s: s != "") (map toString lst);
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
                vals = to_non_empty_list v;
              in
              map (vv: "${k} = ${vv}") vals
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
      rendered = lib.concatStringsSep "\n\n" (
        lib.filter (s: s != "") (lib.mapAttrsToList render_section sections)
      );
    in
    rendered;
in
{
  options.eiros.system.desktop_environment.dank_material_shell = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable the Eiros Dank Material Shell";
    };
    greeter = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable the Eiros Dank Material Shell Greeter";
      };
      logs.enable = lib.mkOption {
        default = true;
        description = "Enables the logging of the greeter messages to a file";
        type = lib.types.bool;
      };
      hyprland = {
        sections = lib.mkOption {
          type = lib.types.attrsOf (lib.types.attrsOf hypr_value_type);
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
              kb_variant = "dvorak";
              kb_options = [
                "caps:escape"
                "compose:ralt"
              ];
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
            };
            "" = {
              bind = [
                "SUPER,Return,exec,kitty"
                "SUPER,Q,killactive,"
              ];
            };
          };
        };
      };
    };
  };
  config = {
    environment.systemPackages = [
      pkgs.dbus
      (pkgs.writeShellScriptBin "start-hyprland" ''
        #!/usr/bin/env bash
        set -euo pipefail

        # dms-greeter invokes: start-hyprland -- --config /path/to/config
        if [[ "''${1:-}" == "--" ]]; then shift; fi

        exec ${pkgs.dbus}/bin/dbus-run-session ${pkgs.hyprland}/bin/Hyprland "$@"
      '')
    ];
    programs.hyprland.enable = true;
    programs.dank-material-shell = lib.mkIf eiros_dms.enable {
      enable = true;
      greeter = lib.mkIf eiros_dms.greeter.enable {
        enable = true;
        logs = lib.mkIf eiros_dms.greeter.logs.enable {
          save = true;
          path = "/tmp/dms-greeter.log";
        };
        compositor = {
          name = "hyprland";
          customConfig = render_hypr_config eiros_dms.greeter.hyprland.sections;
        };
      };
      systemd = {
        enable = true;
        restartIfChanged = true;
      };
    };
  };
}
