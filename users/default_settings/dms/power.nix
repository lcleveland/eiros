# DMS power management timeouts, profiles, battery charge limit,
# and power menu appearance and custom action overrides.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.power = {

    # ── AC power settings ──────────────────────────────────────────────────
    ac = {
      monitor_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Idle seconds before monitors turn off on AC power. 0 = never.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.ac.monitor_timeout = 600;
          }
        '';
      };

      lock_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Idle seconds before locking on AC power. 0 = never.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.ac.lock_timeout = 900;
          }
        '';
      };

      suspend_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Idle seconds before suspending on AC power. 0 = never.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.ac.suspend_timeout = 1800;
          }
        '';
      };

      suspend_behavior = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Suspend action on AC power. 0 = Suspend, 1 = Hibernate, 2 = SuspendThenHibernate.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.ac.suspend_behavior = 1;
          }
        '';
      };

      profile_name = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Power profile to activate on AC power (e.g. performance, balanced, power-saver).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.ac.profile_name = "performance";
          }
        '';
      };

      post_lock_monitor_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Seconds after locking before monitors turn off on AC. 0 = never.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.ac.post_lock_monitor_timeout = 30;
          }
        '';
      };
    };

    # ── Battery power settings ─────────────────────────────────────────────
    battery = {
      monitor_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Idle seconds before monitors turn off on battery. 0 = never.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.battery.monitor_timeout = 300;
          }
        '';
      };

      lock_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Idle seconds before locking on battery. 0 = never.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.battery.lock_timeout = 600;
          }
        '';
      };

      suspend_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Idle seconds before suspending on battery. 0 = never.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.battery.suspend_timeout = 900;
          }
        '';
      };

      suspend_behavior = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Suspend action on battery. 0 = Suspend, 1 = Hibernate, 2 = SuspendThenHibernate.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.battery.suspend_behavior = 1;
          }
        '';
      };

      profile_name = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Power profile to activate on battery.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.battery.profile_name = "power-saver";
          }
        '';
      };

      post_lock_monitor_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Seconds after locking before monitors turn off on battery. 0 = never.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.battery.post_lock_monitor_timeout = 15;
          }
        '';
      };

      charge_limit = lib.mkOption {
        default = 100;
        type = lib.types.int;
        description = "Battery charge limit percentage (50–100).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.battery.charge_limit = 80;
          }
        '';
      };
    };

    # ── Power menu ─────────────────────────────────────────────────────────
    menu = {
      action_confirm = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Require holding a button to confirm power menu actions.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.menu.action_confirm = false;
          }
        '';
      };

      action_hold_duration = lib.mkOption {
        default = 0.5;
        type = lib.types.float;
        description = "Hold duration in seconds to confirm a power action.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.menu.action_hold_duration = 1.0;
          }
        '';
      };

      actions = lib.mkOption {
        default = [
          "reboot"
          "logout"
          "poweroff"
          "lock"
          "suspend"
          "restart"
        ];
        type = lib.types.listOf lib.types.str;
        description = "Ordered list of actions shown in the power menu.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.menu.actions = [ "lock" "suspend" "poweroff" ];
          }
        '';
      };

      default_action = lib.mkOption {
        default = "logout";
        type = lib.types.str;
        description = "Default highlighted action in the power menu.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.menu.default_action = "lock";
          }
        '';
      };

      grid_layout = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Use a grid layout for the power menu instead of a list.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.menu.grid_layout = true;
          }
        '';
      };
    };

    # ── Custom power action overrides ──────────────────────────────────────
    custom_actions = {
      lock = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command for the lock action. Empty = DMS default.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.custom_actions.lock = "swaylock";
          }
        '';
      };

      logout = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command for the logout action. Empty = DMS default.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.custom_actions.logout = "niri msg action quit";
          }
        '';
      };

      suspend = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command for the suspend action. Empty = DMS default.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.custom_actions.suspend = "systemctl suspend";
          }
        '';
      };

      hibernate = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command for the hibernate action. Empty = DMS default.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.custom_actions.hibernate = "systemctl hibernate";
          }
        '';
      };

      reboot = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command for the reboot action. Empty = DMS default.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.custom_actions.reboot = "systemctl reboot";
          }
        '';
      };

      power_off = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command for the power-off action. Empty = DMS default.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.power.custom_actions.power_off = "systemctl poweroff";
          }
        '';
      };
    };

  };
}
