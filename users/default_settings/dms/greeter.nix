# DMS greeter (login screen) session memory, authentication, clock,
# wallpaper, and font options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms = {

    # ── Greeter user settings ──────────────────────────────────────────────
    greeter_remember_last_session = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Remember the last selected session in the greeter login screen.";
    };

    greeter_remember_last_user = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Remember the last logged-in user in the greeter.";
    };

    greeter_enable_fprint = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable fingerprint authentication in the greeter.";
    };

    greeter_enable_u2f = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable U2F/FIDO2 authentication in the greeter.";
    };

    greeter_wallpaper_path = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Absolute path to the greeter wallpaper. Empty = system wallpaper.";
    };

    greeter_use24_hour_clock = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Use 24-hour format for the greeter clock.";
    };

    greeter_show_seconds = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show seconds in the greeter clock.";
    };

    greeter_pad_hours12_hour = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Zero-pad hours in 12-hour format on the greeter clock.";
    };

    greeter_lock_date_format = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Custom Qt date format for the greeter. Empty = locale default.";
    };

    greeter_font_family = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Font family for the greeter UI. Empty = system default.";
    };

    greeter_wallpaper_fill_mode = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Fill mode for the greeter wallpaper. Empty = uses wallpaperFillMode.";
    };

  };
}
