# DMS lock screen layout, authentication, fade, and idle behavior options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms = {

    # ── Lock screen ────────────────────────────────────────────────────────
    lock_screen_show_power_actions = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show power action buttons on the lock screen.";
    };

    lock_screen_show_system_icons = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show system status icons (network, battery) on the lock screen.";
    };

    lock_screen_show_time = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the current time on the lock screen.";
    };

    lock_screen_show_date = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the current date on the lock screen.";
    };

    lock_screen_show_profile_image = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the user avatar on the lock screen.";
    };

    lock_screen_show_password_field = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the password input field on the lock screen.";
    };

    lock_screen_show_media_player = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the media player controls on the lock screen.";
    };

    lock_screen_power_off_monitors_on_lock = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Turn off all monitors immediately when the screen locks.";
    };

    lock_at_startup = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Lock the screen when DMS starts.";
    };

    lock_screen_active_monitor = lib.mkOption {
      default = "all";
      type = lib.types.str;
      description = "Which monitors display the lock screen. Options: all, focused, primary.";
    };

    lock_screen_inactive_color = lib.mkOption {
      default = "#000000";
      type = lib.types.str;
      description = "Background color shown on inactive monitors during lock (hex).";
    };

    lock_screen_notification_mode = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Notification display on lock screen. 0 = None, 1 = Count, 2 = Full.";
    };

    lock_screen_video_enabled = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Use a video as the lock screen background.";
    };

    lock_screen_video_path = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Absolute path to the lock screen background video.";
    };

    lock_screen_video_cycling = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Cycle through multiple videos as lock screen backgrounds.";
    };

    fade_to_lock_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Fade the screen before locking.";
    };

    fade_to_lock_grace_period = lib.mkOption {
      default = 5;
      type = lib.types.int;
      description = "Seconds before the screen fades prior to locking.";
    };

    fade_to_dpms_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Fade the screen before monitors turn off (DPMS).";
    };

    fade_to_dpms_grace_period = lib.mkOption {
      default = 5;
      type = lib.types.int;
      description = "Seconds before the screen fades prior to DPMS off.";
    };

    enable_fprint = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable fingerprint authentication on the lock screen.";
    };

    max_fprint_tries = lib.mkOption {
      default = 15;
      type = lib.types.int;
      description = "Maximum fingerprint attempts before falling back to password.";
    };

    enable_u2f = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable U2F/FIDO2 key authentication on the lock screen.";
    };

    u2f_mode = lib.mkOption {
      default = "or";
      type = lib.types.str;
      description = "U2F authentication mode. Options: or (key OR password), and (key AND password).";
    };

    hide_brightness_slider = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Hide the brightness slider on the lock screen.";
    };

    loginctl_lock_integration = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Respond to loginctl lock-session events.";
    };

    lock_before_suspend = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Lock the screen before suspending.";
    };

    modal_darken_background = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Darken the background when a modal dialog is open.";
    };

  };
}
