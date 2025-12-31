{ config, lib, ... }:
let
  eiros_language = config.eiros.system.language;
in
{
  options.eiros.system.language.locale = lib.mkOption {
    default = "en_US.UTF-8";
    description = "Language locale for the system (e.g. en_US.UTF-8)";
    type = lib.types.str;
  };

  config.i18n = {
    defaultLocale = eiros_language.locale;

    extraLocaleSettings = {
      LC_ADDRESS = eiros_language.locale;
      LC_IDENTIFICATION = eiros_language.locale;
      LC_MEASUREMENT = eiros_language.locale;
      LC_MONETARY = eiros_language.locale;
      LC_NAME = eiros_language.locale;
      LC_NUMERIC = eiros_language.locale;
      LC_PAPER = eiros_language.locale;
      LC_TELEPHONE = eiros_language.locale;
      LC_TIME = eiros_language.locale;
    };
  };
}
