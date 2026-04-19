# DMS greeter (login screen) session memory, authentication, clock,
# wallpaper, and font options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.greeter = {

    remember_last_session = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Remember the last selected session in the greeter login screen.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.greeter.remember_last_session = false;
        }
      '';
    };

    remember_last_user = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Remember the last logged-in user in the greeter.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.greeter.remember_last_user = false;
        }
      '';
    };

    fprint.enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable fingerprint authentication in the greeter.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.greeter.fprint.enable = true;
        }
      '';
    };

    u2f.enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable U2F/FIDO2 authentication in the greeter.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.greeter.u2f.enable = true;
        }
      '';
    };

    wallpaper_path = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Absolute path to the greeter wallpaper. Empty = system wallpaper.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.greeter.wallpaper_path = "/home/user/wallpaper.jpg";
        }
      '';
    };

    use_24_hour_clock = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Use 24-hour format for the greeter clock.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.greeter.use_24_hour_clock = false;
        }
      '';
    };

    show_seconds = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show seconds in the greeter clock.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.greeter.show_seconds = true;
        }
      '';
    };

    pad_hours_12_hour = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Zero-pad hours in 12-hour format on the greeter clock.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.greeter.pad_hours_12_hour = true;
        }
      '';
    };

    lock_date_format = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Custom Qt date format for the greeter. Empty = locale default.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.greeter.lock_date_format = "dddd, MMMM d";
        }
      '';
    };

    font_family = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Font family for the greeter UI. Empty = system default.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.greeter.font_family = "Inter Variable";
        }
      '';
    };

    wallpaper_fill_mode = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Fill mode for the greeter wallpaper. Empty = uses wallpaperFillMode.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.greeter.wallpaper_fill_mode = "Fit";
        }
      '';
    };

  };
}
