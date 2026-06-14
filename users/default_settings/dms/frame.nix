# DMS frame / connected-surface chrome (v1.5): a window-framing decoration that
# draws a rounded, optionally-blurred frame around the desktop with the bar
# embedded into it. "connected" mode unifies the surface chrome via SDF rendering.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.frame = {

    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable the desktop frame / connected-surface chrome.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.enable = true;
        }
      '';
    };

    mode = lib.mkOption {
      default = "connected";
      type = lib.types.str;
      description = "Frame rendering mode. Options: connected, standalone.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.mode = "standalone";
        }
      '';
    };

    color = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Frame color (hex). Empty = use the active theme color.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.color = "#1a1a2e";
        }
      '';
    };

    opacity = lib.mkOption {
      default = 1.0;
      type = lib.types.float;
      description = "Frame opacity (0.0–1.0).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.opacity = 0.85;
        }
      '';
    };

    rounding = lib.mkOption {
      default = 23;
      type = lib.types.int;
      description = "Frame inner corner rounding (pixels).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.rounding = 16;
        }
      '';
    };

    thickness = lib.mkOption {
      default = 16;
      type = lib.types.int;
      description = "Frame thickness on the non-bar edges (pixels).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.thickness = 8;
        }
      '';
    };

    bar_size = lib.mkOption {
      default = 40;
      type = lib.types.int;
      description = "Size of the bar edge embedded in the frame (pixels).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.bar_size = 36;
        }
      '';
    };

    blur_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Apply background blur to the frame (requires compositor blur support).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.blur_enabled = false;
        }
      '';
    };

    close_gaps = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Close the gaps between the frame and windows for a seamless look.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.close_gaps = false;
        }
      '';
    };

    show_on_overview = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Keep the frame visible while the overview/expo is open.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.show_on_overview = true;
        }
      '';
    };

    screen_preferences = lib.mkOption {
      default = [ "all" ];
      type = lib.types.listOf lib.types.str;
      description = "Which screens show the frame. \"all\" = every screen, or list output names.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.screen_preferences = [ "DP-1" ];
        }
      '';
    };

    launcher_arc_extender = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Extend the frame with a launcher arc.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.launcher_arc_extender = true;
        }
      '';
    };

    launcher_emerge_side = lib.mkOption {
      default = "bottom";
      type = lib.types.str;
      description = "Side from which the launcher emerges out of the frame. Options: top, bottom, left, right.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.launcher_emerge_side = "top";
        }
      '';
    };

    connected_bar_style_backups = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.anything;
      description = "Saved bar style backups preserved when toggling connected frame mode. Normally managed at runtime.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.frame.connected_bar_style_backups = { };
        }
      '';
    };

  };
}
