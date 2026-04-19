# DMS notification popup and history options, plus on-screen display (OSD) options.
{ lib, ... }:
let
  mkOsdBoolOption = default: desc: lib.mkOption {
    inherit default;
    type = lib.types.bool;
    description = desc;
  };
in
{
  options.eiros.system.user_defaults.dms.notifications = {

    # ── Notification timeouts ──────────────────────────────────────────────
    timeout = {
      low = lib.mkOption {
        default = 5000;
        type = lib.types.int;
        description = "Auto-dismiss timeout for low-urgency notifications (ms). 0 = never.";
      };

      normal = lib.mkOption {
        default = 5000;
        type = lib.types.int;
        description = "Auto-dismiss timeout for normal-urgency notifications (ms). 0 = never.";
      };

      critical = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Auto-dismiss timeout for critical notifications (ms). 0 = never.";
      };
    };

    # ── Notification popup ─────────────────────────────────────────────────
    compact_mode = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Use compact display for notification popups.";
    };

    popup = {
      position = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Notification popup screen position. 0=Top, 1=Bottom, 2=Left, 3=Right, 4=TopCenter, 5=BottomCenter, 6=LeftCenter, 7=RightCenter.";
      };

      shadow.enable = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show a drop shadow under notification popups.";
      };

      privacy_mode = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Hide notification body in popups (show app name only).";
      };
    };

    animation_speed = lib.mkOption {
      default = 1;
      type = lib.types.int;
      description = "Notification popup animation speed. 0=None, 1=Short, 2=Medium, 3=Long, 4=Custom.";
    };

    custom_animation_duration = lib.mkOption {
      default = 400;
      type = lib.types.int;
      description = "Custom notification animation duration (ms). Used when animation_speed = 4.";
    };

    # ── Notification history ───────────────────────────────────────────────
    history = {
      enable = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Persist notifications in the notification center history.";
      };

      max_count = lib.mkOption {
        default = 50;
        type = lib.types.int;
        description = "Maximum number of notifications kept in history.";
      };

      max_age_days = lib.mkOption {
        default = 7;
        type = lib.types.int;
        description = "Maximum age (days) for history entries. 0 = unlimited.";
      };

      save_low = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Save low-urgency notifications to history.";
      };

      save_normal = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Save normal-urgency notifications to history.";
      };

      save_critical = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Save critical notifications to history.";
      };
    };

    rules = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.anything;
      description = "Custom notification filter/routing rules.";
    };

    focused_monitor = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Only show notification popups on the currently focused monitor.";
    };

    overlay.enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show notifications as a persistent overlay instead of dismissable popups.";
    };

    # ── OSD ────────────────────────────────────────────────────────────────
    osd = {
      always_show_value = mkOsdBoolOption false "Always show the current value in OSD indicators, not just on change.";

      position = lib.mkOption {
        default = 5;
        type = lib.types.int;
        description = "OSD screen position. 0=Top, 1=Bottom, 2=Left, 3=Right, 4=TopCenter, 5=BottomCenter, 6=LeftCenter, 7=RightCenter.";
      };

      volume_enabled = mkOsdBoolOption true "Show OSD when volume changes.";
      media_volume_enabled = mkOsdBoolOption true "Show OSD when media volume changes.";
      media_playback_enabled = mkOsdBoolOption false "Show OSD on media playback changes (play/pause/skip).";
      brightness_enabled = mkOsdBoolOption true "Show OSD when screen brightness changes.";
      idle_inhibitor_enabled = mkOsdBoolOption true "Show OSD when the idle inhibitor state changes.";
      mic_mute_enabled = mkOsdBoolOption true "Show OSD when the microphone is muted or unmuted.";
      caps_lock_enabled = mkOsdBoolOption true "Show OSD when caps lock toggles.";
      power_profile_enabled = mkOsdBoolOption false "Show OSD when the power profile changes.";
      audio_output_enabled = mkOsdBoolOption true "Show OSD when the audio output device changes.";
    };

  };
}
