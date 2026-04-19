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
      };

      lock_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Idle seconds before locking on AC power. 0 = never.";
      };

      suspend_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Idle seconds before suspending on AC power. 0 = never.";
      };

      suspend_behavior = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Suspend action on AC power. 0 = Suspend, 1 = Hibernate, 2 = SuspendThenHibernate.";
      };

      profile_name = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Power profile to activate on AC power (e.g. performance, balanced, power-saver).";
      };

      post_lock_monitor_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Seconds after locking before monitors turn off on AC. 0 = never.";
      };
    };

    # ── Battery power settings ─────────────────────────────────────────────
    battery = {
      monitor_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Idle seconds before monitors turn off on battery. 0 = never.";
      };

      lock_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Idle seconds before locking on battery. 0 = never.";
      };

      suspend_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Idle seconds before suspending on battery. 0 = never.";
      };

      suspend_behavior = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Suspend action on battery. 0 = Suspend, 1 = Hibernate, 2 = SuspendThenHibernate.";
      };

      profile_name = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Power profile to activate on battery.";
      };

      post_lock_monitor_timeout = lib.mkOption {
        default = 0;
        type = lib.types.int;
        description = "Seconds after locking before monitors turn off on battery. 0 = never.";
      };

      charge_limit = lib.mkOption {
        default = 100;
        type = lib.types.int;
        description = "Battery charge limit percentage (50–100).";
      };
    };

    # ── Power menu ─────────────────────────────────────────────────────────
    menu = {
      action_confirm = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Require holding a button to confirm power menu actions.";
      };

      action_hold_duration = lib.mkOption {
        default = 0.5;
        type = lib.types.float;
        description = "Hold duration in seconds to confirm a power action.";
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
      };

      default_action = lib.mkOption {
        default = "logout";
        type = lib.types.str;
        description = "Default highlighted action in the power menu.";
      };

      grid_layout = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Use a grid layout for the power menu instead of a list.";
      };
    };

    # ── Custom power action overrides ──────────────────────────────────────
    custom_actions = {
      lock = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command for the lock action. Empty = DMS default.";
      };

      logout = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command for the logout action. Empty = DMS default.";
      };

      suspend = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command for the suspend action. Empty = DMS default.";
      };

      hibernate = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command for the hibernate action. Empty = DMS default.";
      };

      reboot = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command for the reboot action. Empty = DMS default.";
      };

      power_off = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Custom shell command for the power-off action. Empty = DMS default.";
      };
    };

  };
}
