# DMS lock screen layout, authentication, fade, and idle behavior options.
{ lib, ... }:
let
  mkBoolOption = default: desc: lib.mkOption {
    inherit default;
    type = lib.types.bool;
    description = desc;
  };
in
{
  options.eiros.system.user_defaults.dms.lock_screen = {

    show_power_actions = mkBoolOption true "Show power action buttons on the lock screen.";
    show_system_icons = mkBoolOption true "Show system status icons (network, battery) on the lock screen.";
    show_time = mkBoolOption true "Show the current time on the lock screen.";
    show_date = mkBoolOption true "Show the current date on the lock screen.";
    show_profile_image = mkBoolOption true "Show the user avatar on the lock screen.";
    show_password_field = mkBoolOption true "Show the password input field on the lock screen.";
    show_media_player = mkBoolOption true "Show the media player controls on the lock screen.";
    power_off_monitors_on_lock = mkBoolOption false "Turn off all monitors immediately when the screen locks.";

    at_startup = mkBoolOption false "Lock the screen when DMS starts.";

    active_monitor = lib.mkOption {
      default = "all";
      type = lib.types.str;
      description = "Which monitors display the lock screen. Options: all, focused, primary.";
    };

    inactive_color = lib.mkOption {
      default = "#000000";
      type = lib.types.str;
      description = "Background color shown on inactive monitors during lock (hex).";
    };

    notification_mode = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Notification display on lock screen. 0 = None, 1 = Count, 2 = Full.";
    };

    # ── Video background ───────────────────────────────────────────────────
    video = {
      enable = mkBoolOption false "Use a video as the lock screen background.";

      path = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Absolute path to the lock screen background video.";
      };

      cycling = mkBoolOption false "Cycle through multiple videos as lock screen backgrounds.";
    };

    # ── Fade behavior ──────────────────────────────────────────────────────
    fade_to_lock = {
      enable = mkBoolOption true "Fade the screen before locking.";

      grace_period = lib.mkOption {
        default = 5;
        type = lib.types.int;
        description = "Seconds before the screen fades prior to locking.";
      };
    };

    fade_to_dpms = {
      enable = mkBoolOption true "Fade the screen before monitors turn off (DPMS).";

      grace_period = lib.mkOption {
        default = 5;
        type = lib.types.int;
        description = "Seconds before the screen fades prior to DPMS off.";
      };
    };

    # ── Authentication ─────────────────────────────────────────────────────
    fprint = {
      enable = mkBoolOption false "Enable fingerprint authentication on the lock screen.";

      max_tries = lib.mkOption {
        default = 15;
        type = lib.types.int;
        description = "Maximum fingerprint attempts before falling back to password.";
      };
    };

    u2f = {
      enable = mkBoolOption false "Enable U2F/FIDO2 key authentication on the lock screen.";

      mode = lib.mkOption {
        default = "or";
        type = lib.types.str;
        description = "U2F authentication mode. Options: or (key OR password), and (key AND password).";
      };
    };

    hide_brightness_slider = mkBoolOption false "Hide the brightness slider on the lock screen.";
    loginctl_lock_integration = mkBoolOption true "Respond to loginctl lock-session events.";
    lock_before_suspend = mkBoolOption false "Lock the screen before suspending.";
    modal_darken_background = mkBoolOption true "Darken the background when a modal dialog is open.";

  };
}
