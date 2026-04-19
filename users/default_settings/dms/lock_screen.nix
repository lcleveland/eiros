# DMS lock screen layout, authentication, fade, and idle behavior options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.lock_screen = {

    show_power_actions = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show power action buttons on the lock screen.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.show_power_actions = false;
        }
      '';
    };

    show_system_icons = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show system status icons (network, battery) on the lock screen.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.show_system_icons = false;
        }
      '';
    };

    show_time = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the current time on the lock screen.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.show_time = false;
        }
      '';
    };

    show_date = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the current date on the lock screen.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.show_date = false;
        }
      '';
    };

    show_profile_image = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the user avatar on the lock screen.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.show_profile_image = false;
        }
      '';
    };

    show_password_field = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the password input field on the lock screen.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.show_password_field = false;
        }
      '';
    };

    show_media_player = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the media player controls on the lock screen.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.show_media_player = false;
        }
      '';
    };

    power_off_monitors_on_lock = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Turn off all monitors immediately when the screen locks.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.power_off_monitors_on_lock = true;
        }
      '';
    };

    at_startup = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Lock the screen when DMS starts.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.at_startup = true;
        }
      '';
    };

    active_monitor = lib.mkOption {
      default = "all";
      type = lib.types.str;
      description = "Which monitors display the lock screen. Options: all, focused, primary.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.active_monitor = "primary";
        }
      '';
    };

    inactive_color = lib.mkOption {
      default = "#000000";
      type = lib.types.str;
      description = "Background color shown on inactive monitors during lock (hex).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.inactive_color = "#1a1a2e";
        }
      '';
    };

    notification_mode = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Notification display on lock screen. 0 = None, 1 = Count, 2 = Full.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.notification_mode = 1;
        }
      '';
    };

    # ── Video background ───────────────────────────────────────────────────
    video = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Use a video as the lock screen background.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.lock_screen.video.enable = true;
          }
        '';
      };

      path = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Absolute path to the lock screen background video.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.lock_screen.video.path = "/home/user/videos/lockscreen.mp4";
          }
        '';
      };

      cycling = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Cycle through multiple videos as lock screen backgrounds.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.lock_screen.video.cycling = true;
          }
        '';
      };
    };

    # ── Fade behavior ──────────────────────────────────────────────────────
    fade_to_lock = {
      enable = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Fade the screen before locking.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.lock_screen.fade_to_lock.enable = false;
          }
        '';
      };

      grace_period = lib.mkOption {
        default = 5;
        type = lib.types.int;
        description = "Seconds before the screen fades prior to locking.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.lock_screen.fade_to_lock.grace_period = 10;
          }
        '';
      };
    };

    fade_to_dpms = {
      enable = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Fade the screen before monitors turn off (DPMS).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.lock_screen.fade_to_dpms.enable = false;
          }
        '';
      };

      grace_period = lib.mkOption {
        default = 5;
        type = lib.types.int;
        description = "Seconds before the screen fades prior to DPMS off.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.lock_screen.fade_to_dpms.grace_period = 10;
          }
        '';
      };
    };

    # ── Authentication ─────────────────────────────────────────────────────
    fprint = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Enable fingerprint authentication on the lock screen.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.lock_screen.fprint.enable = true;
          }
        '';
      };

      max_tries = lib.mkOption {
        default = 15;
        type = lib.types.int;
        description = "Maximum fingerprint attempts before falling back to password.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.lock_screen.fprint.max_tries = 5;
          }
        '';
      };
    };

    u2f = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Enable U2F/FIDO2 key authentication on the lock screen.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.lock_screen.u2f.enable = true;
          }
        '';
      };

      mode = lib.mkOption {
        default = "or";
        type = lib.types.str;
        description = "U2F authentication mode. Options: or (key OR password), and (key AND password).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.lock_screen.u2f.mode = "and";
          }
        '';
      };
    };

    hide_brightness_slider = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Hide the brightness slider on the lock screen.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.hide_brightness_slider = true;
        }
      '';
    };

    loginctl_lock_integration = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Respond to loginctl lock-session events.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.loginctl_lock_integration = false;
        }
      '';
    };

    lock_before_suspend = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Lock the screen before suspending.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.lock_before_suspend = true;
        }
      '';
    };

    modal_darken_background = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Darken the background when a modal dialog is open.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.lock_screen.modal_darken_background = false;
        }
      '';
    };

  };
}
