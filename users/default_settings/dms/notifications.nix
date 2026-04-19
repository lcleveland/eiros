# DMS notification popup and history options, plus on-screen display (OSD) options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms = {

    # ── Notifications ──────────────────────────────────────────────────────
    notification_timeout_low = lib.mkOption {
      default = 5000;
      type = lib.types.int;
      description = "Auto-dismiss timeout for low-urgency notifications (ms). 0 = never.";
    };

    notification_timeout_normal = lib.mkOption {
      default = 5000;
      type = lib.types.int;
      description = "Auto-dismiss timeout for normal-urgency notifications (ms). 0 = never.";
    };

    notification_timeout_critical = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Auto-dismiss timeout for critical notifications (ms). 0 = never.";
    };

    notification_compact_mode = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Use compact display for notification popups.";
    };

    notification_popup_position = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Notification popup screen position. 0=Top, 1=Bottom, 2=Left, 3=Right, 4=TopCenter, 5=BottomCenter, 6=LeftCenter, 7=RightCenter.";
    };

    notification_animation_speed = lib.mkOption {
      default = 1;
      type = lib.types.int;
      description = "Notification popup animation speed. 0=None, 1=Short, 2=Medium, 3=Long, 4=Custom.";
    };

    notification_custom_animation_duration = lib.mkOption {
      default = 400;
      type = lib.types.int;
      description = "Custom notification animation duration (ms).";
    };

    notification_history_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Persist notifications in the notification center history.";
    };

    notification_history_max_count = lib.mkOption {
      default = 50;
      type = lib.types.int;
      description = "Maximum number of notifications kept in history.";
    };

    notification_history_max_age_days = lib.mkOption {
      default = 7;
      type = lib.types.int;
      description = "Maximum age (days) for history entries. 0 = unlimited.";
    };

    notification_history_save_low = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Save low-urgency notifications to history.";
    };

    notification_history_save_normal = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Save normal-urgency notifications to history.";
    };

    notification_history_save_critical = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Save critical notifications to history.";
    };

    notification_rules = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.anything;
      description = "Custom notification filter/routing rules.";
    };

    notification_focused_monitor = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Only show notification popups on the currently focused monitor.";
    };

    notification_overlay_enabled = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show notifications as a persistent overlay instead of dismissable popups.";
    };

    notification_popup_shadow_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show a drop shadow under notification popups.";
    };

    notification_popup_privacy_mode = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Hide notification body in popups (show app name only).";
    };

    # ── OSD ────────────────────────────────────────────────────────────────
    osd_always_show_value = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Always show the current value in OSD indicators, not just on change.";
    };

    osd_position = lib.mkOption {
      default = 5;
      type = lib.types.int;
      description = "OSD screen position. 0=Top, 1=Bottom, 2=Left, 3=Right, 4=TopCenter, 5=BottomCenter, 6=LeftCenter, 7=RightCenter.";
    };

    osd_volume_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show OSD when volume changes.";
    };

    osd_media_volume_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show OSD when media volume changes.";
    };

    osd_media_playback_enabled = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show OSD on media playback changes (play/pause/skip).";
    };

    osd_brightness_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show OSD when screen brightness changes.";
    };

    osd_idle_inhibitor_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show OSD when the idle inhibitor state changes.";
    };

    osd_mic_mute_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show OSD when the microphone is muted or unmuted.";
    };

    osd_caps_lock_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show OSD when caps lock toggles.";
    };

    osd_power_profile_enabled = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show OSD when the power profile changes.";
    };

    osd_audio_output_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show OSD when the audio output device changes.";
    };

  };
}
