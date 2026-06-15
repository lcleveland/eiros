# Configures systemd-logind lid, power button, and idle behaviour.
{ config, lib, ... }:
let
  eiros_logind = config.eiros.system.hardware.logind;
in
{
  options.eiros.system.hardware.logind = {
    enable = lib.mkOption {
      default = true;
      description = "Configure systemd-logind lid, power button, and idle behaviour.";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.logind.enable = false;
        }
      '';
      type = lib.types.bool;
    };

    lid_switch = lib.mkOption {
      default = "suspend";
      description = "Action when the lid is closed on battery (suspend, lock, ignore, hibernate, poweroff).";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.logind.lid_switch = "lock";
        }
      '';
      type = lib.types.enum [
        "suspend"
        "lock"
        "ignore"
        "hibernate"
        "poweroff"
      ];
    };

    lid_switch_external_power = lib.mkOption {
      default = "lock";
      description = "Action when the lid is closed on external power (suspend, lock, ignore, hibernate, poweroff).";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.logind.lid_switch_external_power = "ignore";
        }
      '';
      type = lib.types.enum [
        "suspend"
        "lock"
        "ignore"
        "hibernate"
        "poweroff"
      ];
    };

    lid_switch_docked = lib.mkOption {
      default = "ignore";
      description = "Action when the lid is closed while docked or while two or more displays are connected. Takes precedence over lid_switch and lid_switch_external_power when systemd-logind detects a docking station (ACPI _DCK) or more than one display.";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.logind.lid_switch_docked = "lock";
        }
      '';
      type = lib.types.enum [
        "suspend"
        "lock"
        "ignore"
        "hibernate"
        "poweroff"
      ];
    };

    lock_screen_on_lid_close_when_undocked = lib.mkOption {
      default = true;
      description = "Lock the screen before the system suspends from a lid close, so resuming an undocked laptop never briefly exposes the desktop. Implemented by enabling DMS's lockBeforeSuspend; as a side effect this also locks before idle-timeout suspends and manual `systemctl suspend` (both desirable). Has no effect when docked because lid_switch_docked defaults to \"ignore\" — no suspend, nothing to lock before.";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.logind.lock_screen_on_lid_close_when_undocked = false;
        }
      '';
      type = lib.types.bool;
    };

    power_key = lib.mkOption {
      default = "suspend";
      description = "Action when the power button is pressed (suspend, lock, ignore, hibernate, poweroff).";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.logind.power_key = "poweroff";
        }
      '';
      type = lib.types.enum [
        "suspend"
        "lock"
        "ignore"
        "hibernate"
        "poweroff"
      ];
    };

    idle_action = lib.mkOption {
      default = "suspend";
      description = "Action taken after idle_timeout_sec of inactivity (suspend, lock, ignore, hibernate, poweroff).";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.logind.idle_action = "lock";
        }
      '';
      type = lib.types.enum [
        "suspend"
        "lock"
        "ignore"
        "hibernate"
        "poweroff"
      ];
    };

    idle_timeout_sec = lib.mkOption {
      default = 600;
      description = "Seconds of inactivity before idle_action is triggered.";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.logind.idle_timeout_sec = 300;
        }
      '';
      type = lib.types.int;
    };
  };

  config = lib.mkIf eiros_logind.enable {
    assertions = [
      {
        assertion = eiros_logind.idle_timeout_sec > 0;
        message = "eiros.system.hardware.logind.idle_timeout_sec must be greater than 0.";
      }
    ];

    services.logind.settings.Login = {
      HandleLidSwitch = eiros_logind.lid_switch;
      HandleLidSwitchExternalPower = eiros_logind.lid_switch_external_power;
      HandleLidSwitchDocked = eiros_logind.lid_switch_docked;
      HandlePowerKey = eiros_logind.power_key;
      IdleAction = eiros_logind.idle_action;
      IdleActionSec = eiros_logind.idle_timeout_sec;
    };

    eiros.system.user_defaults.dms.lock_screen.lock_before_suspend =
      lib.mkDefault eiros_logind.lock_screen_on_lid_close_when_undocked;
  };
}
