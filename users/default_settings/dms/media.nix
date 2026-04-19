# DMS font, clock & date, weather, media player, and sound options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.media = {

    # ── Fonts ──────────────────────────────────────────────────────────────
    font = {
      family = lib.mkOption {
        default = "Inter Variable";
        type = lib.types.str;
        description = "Primary UI font family.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.font.family = "Roboto";
          }
        '';
      };

      mono_family = lib.mkOption {
        default = "Fira Code";
        type = lib.types.str;
        description = "Monospace font family used in terminal and code widgets.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.font.mono_family = "JetBrains Mono";
          }
        '';
      };

      weight = lib.mkOption {
        default = 400;
        type = lib.types.int;
        description = "Global UI font weight (100–900). 400 = Normal, 700 = Bold.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.font.weight = 500;
          }
        '';
      };

      scale = lib.mkOption {
        default = 1.0;
        type = lib.types.float;
        description = "Global UI font scale multiplier.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.font.scale = 1.1;
          }
        '';
      };
    };

    # ── Clock & date ───────────────────────────────────────────────────────
    clock = {
      use_24_hour = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Use 24-hour time format.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.clock.use_24_hour = false;
          }
        '';
      };

      show_seconds = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show seconds in the clock widget.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.clock.show_seconds = true;
          }
        '';
      };

      pad_hours_12_hour = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Zero-pad hours in 12-hour format (e.g. 09:00 instead of 9:00).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.clock.pad_hours_12_hour = true;
          }
        '';
      };

      date_format = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom Qt date format string for the bar clock. Empty = locale default.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.clock.date_format = "ddd MMM d";
          }
        '';
      };

      lock_date_format = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom Qt date format string for the lock screen. Empty = locale default.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.clock.lock_date_format = "dddd, MMMM d";
          }
        '';
      };
    };

    # ── Calendar ───────────────────────────────────────────────────────────
    calendar = {
      first_day_of_week = lib.mkOption {
        default = -1;
        type = lib.types.int;
        description = "First day of the week in the calendar. -1 = locale default, 0 = Sunday, 1 = Monday.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.calendar.first_day_of_week = 1;
          }
        '';
      };

      show_week_number = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show ISO week numbers in the calendar popup.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.calendar.show_week_number = true;
          }
        '';
      };
    };

    # ── Night mode ─────────────────────────────────────────────────────────
    night_mode.enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable night mode (blue-light filter) by default on login.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.media.night_mode.enable = true;
        }
      '';
    };

    # ── Weather ────────────────────────────────────────────────────────────
    weather = {
      enable = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Enable the weather widget.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.weather.enable = false;
          }
        '';
      };

      use_fahrenheit = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Display temperatures in Fahrenheit (default: Celsius).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.weather.use_fahrenheit = false;
          }
        '';
      };

      wind_speed_unit = lib.mkOption {
        default = "mph";
        type = lib.types.str;
        description = "Wind speed unit. Options: kmh, mph, ms, kn.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.weather.wind_speed_unit = "kmh";
          }
        '';
      };

      use_auto_location = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Automatically detect location for weather data.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.weather.use_auto_location = false;
          }
        '';
      };
    };

    # ── Media player ───────────────────────────────────────────────────────
    player = {
      size = lib.mkOption {
        default = 1;
        type = lib.types.int;
        description = "Media player widget size. 0 = Small, 1 = Medium, 2 = Large.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.player.size = 2;
          }
        '';
      };
    };

    # ── Sounds ─────────────────────────────────────────────────────────────
    sounds = {
      enable = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Enable DMS UI sound effects.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.sounds.enable = false;
          }
        '';
      };

      use_system_theme = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Use the system sound theme instead of DMS built-in sounds.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.sounds.use_system_theme = true;
          }
        '';
      };

      login = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Play a sound on login.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.sounds.login = true;
          }
        '';
      };

      new_notification = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Play a sound for incoming notifications.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.sounds.new_notification = false;
          }
        '';
      };

      volume_changed = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Play a sound when volume changes.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.sounds.volume_changed = false;
          }
        '';
      };

      plugged_in = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Play a sound when a charger is connected.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.media.sounds.plugged_in = false;
          }
        '';
      };
    };

  };
}
