# DMS power management timeouts, profiles, battery charge limit,
# and power menu appearance and custom action overrides.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms = {

    # ── Power management ───────────────────────────────────────────────────
    ac_monitor_timeout = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Idle seconds before monitors turn off on AC power. 0 = never.";
    };

    ac_lock_timeout = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Idle seconds before locking on AC power. 0 = never.";
    };

    ac_suspend_timeout = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Idle seconds before suspending on AC power. 0 = never.";
    };

    ac_suspend_behavior = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Suspend action on AC power. 0 = Suspend, 1 = Hibernate, 2 = SuspendThenHibernate.";
    };

    ac_profile_name = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Power profile to activate on AC power (e.g. performance, balanced, power-saver).";
    };

    ac_post_lock_monitor_timeout = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Seconds after locking before monitors turn off on AC. 0 = never.";
    };

    battery_monitor_timeout = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Idle seconds before monitors turn off on battery. 0 = never.";
    };

    battery_lock_timeout = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Idle seconds before locking on battery. 0 = never.";
    };

    battery_suspend_timeout = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Idle seconds before suspending on battery. 0 = never.";
    };

    battery_suspend_behavior = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Suspend action on battery. 0 = Suspend, 1 = Hibernate, 2 = SuspendThenHibernate.";
    };

    battery_profile_name = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Power profile to activate on battery.";
    };

    battery_post_lock_monitor_timeout = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Seconds after locking before monitors turn off on battery. 0 = never.";
    };

    battery_charge_limit = lib.mkOption {
      default = 100;
      type = lib.types.int;
      description = "Battery charge limit percentage (50–100).";
    };

    # ── Power menu ─────────────────────────────────────────────────────────
    power_action_confirm = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Require holding a button to confirm power menu actions.";
    };

    power_action_hold_duration = lib.mkOption {
      default = 0.5;
      type = lib.types.float;
      description = "Hold duration in seconds to confirm a power action.";
    };

    power_menu_actions = lib.mkOption {
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

    power_menu_default_action = lib.mkOption {
      default = "logout";
      type = lib.types.str;
      description = "Default highlighted action in the power menu.";
    };

    power_menu_grid_layout = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Use a grid layout for the power menu instead of a list.";
    };

    custom_power_action_lock = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Custom shell command for the lock action. Empty = DMS default.";
    };

    custom_power_action_logout = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Custom shell command for the logout action. Empty = DMS default.";
    };

    custom_power_action_suspend = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Custom shell command for the suspend action. Empty = DMS default.";
    };

    custom_power_action_hibernate = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Custom shell command for the hibernate action. Empty = DMS default.";
    };

    custom_power_action_reboot = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Custom shell command for the reboot action. Empty = DMS default.";
    };

    custom_power_action_power_off = lib.mkOption {
      default = "";
      type = lib.types.str;
      description = "Custom shell command for the power-off action. Empty = DMS default.";
    };

  };
}
