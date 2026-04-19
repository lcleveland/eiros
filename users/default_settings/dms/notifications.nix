# DMS notification popup and history options, plus on-screen display (OSD) options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.notifications = {

    # ── Notification timeouts ──────────────────────────────────────────────
    timeout = {
      low = lib.mkOption {
        default = 5000;
        type = lib.types.int;
        description = "Auto-dismiss timeout for low-urgency notifications (ms). 0 = never.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.timeout.low = 3000;
          }
        '';
      };

      normal = lib.mkOption {
        default = 5000;
        type = lib.types.int;
        description = "Auto-dismiss timeout for normal-urgency notifications (ms). 0 = never.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.timeout.normal = 8000;
          }
        '';
      };

      critical = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Auto-dismiss timeout for critical notifications (ms). 0 = never.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.timeout.critical = 10000;
          }
        '';
      };
    };

    # ── Notification popup ─────────────────────────────────────────────────
    compact_mode = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Use compact display for notification popups.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.notifications.compact_mode = true;
        }
      '';
    };

    popup = {
      position = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Notification popup screen position. 0=Top, 1=Bottom, 2=Left, 3=Right, 4=TopCenter, 5=BottomCenter, 6=LeftCenter, 7=RightCenter.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.popup.position = 4;
          }
        '';
      };

      shadow.enable = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show a drop shadow under notification popups.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.popup.shadow.enable = false;
          }
        '';
      };

      privacy_mode = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Hide notification body in popups (show app name only).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.popup.privacy_mode = true;
          }
        '';
      };
    };

    animation_speed = lib.mkOption {
      default = 1;
      type = lib.types.int;
      description = "Notification popup animation speed. 0=None, 1=Short, 2=Medium, 3=Long, 4=Custom.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.notifications.animation_speed = 2;
        }
      '';
    };

    custom_animation_duration = lib.mkOption {
      default = 400;
      type = lib.types.int;
      description = "Custom notification animation duration (ms). Used when animation_speed = 4.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.notifications.custom_animation_duration = 250;
        }
      '';
    };

    # ── Notification history ───────────────────────────────────────────────
    history = {
      enable = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Persist notifications in the notification center history.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.history.enable = false;
          }
        '';
      };

      max_count = lib.mkOption {
        default = 50;
        type = lib.types.int;
        description = "Maximum number of notifications kept in history.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.history.max_count = 100;
          }
        '';
      };

      max_age_days = lib.mkOption {
        default = 7;
        type = lib.types.int;
        description = "Maximum age (days) for history entries. 0 = unlimited.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.history.max_age_days = 14;
          }
        '';
      };

      save_low = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Save low-urgency notifications to history.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.history.save_low = false;
          }
        '';
      };

      save_normal = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Save normal-urgency notifications to history.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.history.save_normal = false;
          }
        '';
      };

      save_critical = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Save critical notifications to history.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.history.save_critical = false;
          }
        '';
      };
    };

    rules = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.anything;
      description = "Custom notification filter/routing rules.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.notifications.rules = [
            { app_name = "Spotify"; urgency = "low"; timeout = 2000; }
          ];
        }
      '';
    };

    focused_monitor = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Only show notification popups on the currently focused monitor.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.notifications.focused_monitor = true;
        }
      '';
    };

    overlay.enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show notifications as a persistent overlay instead of dismissable popups.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.notifications.overlay.enable = true;
        }
      '';
    };

    # ── OSD ────────────────────────────────────────────────────────────────
    osd = {
      always_show_value = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Always show the current value in OSD indicators, not just on change.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.osd.always_show_value = true;
          }
        '';
      };

      position = lib.mkOption {
        default = 5;
        type = lib.types.int;
        description = "OSD screen position. 0=Top, 1=Bottom, 2=Left, 3=Right, 4=TopCenter, 5=BottomCenter, 6=LeftCenter, 7=RightCenter.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.osd.position = 4;
          }
        '';
      };

      volume_enabled = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show OSD when volume changes.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.osd.volume_enabled = false;
          }
        '';
      };

      media_volume_enabled = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show OSD when media volume changes.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.osd.media_volume_enabled = false;
          }
        '';
      };

      media_playback_enabled = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show OSD on media playback changes (play/pause/skip).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.osd.media_playback_enabled = true;
          }
        '';
      };

      brightness_enabled = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show OSD when screen brightness changes.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.osd.brightness_enabled = false;
          }
        '';
      };

      idle_inhibitor_enabled = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show OSD when the idle inhibitor state changes.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.osd.idle_inhibitor_enabled = false;
          }
        '';
      };

      mic_mute_enabled = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show OSD when the microphone is muted or unmuted.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.osd.mic_mute_enabled = false;
          }
        '';
      };

      caps_lock_enabled = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show OSD when caps lock toggles.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.osd.caps_lock_enabled = false;
          }
        '';
      };

      power_profile_enabled = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show OSD when the power profile changes.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.osd.power_profile_enabled = true;
          }
        '';
      };

      audio_output_enabled = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show OSD when the audio output device changes.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.notifications.osd.audio_output_enabled = false;
          }
        '';
      };
    };

  };
}
