# DMS bar options: widget visibility, widget behavior, app ID substitutions,
# centering mode, and bar instance configurations.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms = {

    # ── Bar widget visibility ──────────────────────────────────────────────
    show_launcher_button = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the app launcher button in the bar.";
    };

    show_workspace_switcher = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the workspace switcher in the bar.";
    };

    show_focused_window = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the focused window title/icon in the bar.";
    };

    show_weather = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the weather widget in the bar.";
    };

    show_music = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the media player widget in the bar.";
    };

    show_clipboard = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the clipboard history widget in the bar.";
    };

    show_cpu_usage = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the CPU usage widget in the bar.";
    };

    show_mem_usage = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the memory usage widget in the bar.";
    };

    show_cpu_temp = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the CPU temperature widget in the bar.";
    };

    show_gpu_temp = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the GPU temperature widget in the bar.";
    };

    selected_gpu_index = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Index of the GPU to display temperature for (0-based).";
    };

    enabled_gpu_pci_ids = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
      description = "PCI IDs of GPUs to include in monitoring widgets.";
    };

    show_system_tray = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the system tray in the bar.";
    };

    show_clock = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the clock widget in the bar.";
    };

    show_notification_button = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the notification center toggle button in the bar.";
    };

    show_battery = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the battery indicator in the bar.";
    };

    show_control_center_button = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the control center toggle button in the bar.";
    };

    show_caps_lock_indicator = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the caps lock indicator in the bar.";
    };

    # ── Bar widget behavior ────────────────────────────────────────────────
    wave_progress_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enable the wave progress animation on the media player widget.";
    };

    scroll_title_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enable scrolling for long window titles in the focused window widget.";
    };

    media_adaptive_width_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Let the media player widget adapt its width to content.";
    };

    audio_visualizer_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show an audio waveform visualizer in the media player widget.";
    };

    audio_scroll_mode = lib.mkOption {
      default = "volume";
      type = lib.types.str;
      description = "What scrolling on the audio widget controls. Options: volume, seek.";
    };

    audio_wheel_scroll_amount = lib.mkOption {
      default = 5;
      type = lib.types.int;
      description = "Volume change per scroll step (percent).";
    };

    clock_compact_mode = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Compact clock mode (time only, no date).";
    };

    focused_window_compact_mode = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Compact focused window widget (icon only, no title).";
    };

    running_apps_compact_mode = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Compact running apps widget (icons only, no labels).";
    };

    bar_max_visible_apps = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Maximum pinned apps shown in the bar. 0 = unlimited.";
    };

    bar_max_visible_running_apps = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Maximum running apps shown in the bar. 0 = unlimited.";
    };

    bar_show_overflow_badge = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show an overflow badge when the app limit is exceeded.";
    };

    apps_dock_hide_indicators = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Hide running/open indicators on dock and bar app icons.";
    };

    apps_dock_colorize_active = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Colorize the active app indicator.";
    };

    apps_dock_active_color_mode = lib.mkOption {
      default = "primary";
      type = lib.types.str;
      description = "Color mode for the active app indicator.";
    };

    apps_dock_enlarge_on_hover = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enlarge dock/bar app icons on hover.";
    };

    apps_dock_enlarge_percentage = lib.mkOption {
      default = 125;
      type = lib.types.int;
      description = "Hover enlargement percentage for app icons.";
    };

    apps_dock_icon_size_percentage = lib.mkOption {
      default = 100;
      type = lib.types.int;
      description = "Base icon size as a percentage of the default.";
    };

    keyboard_layout_name_compact_mode = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show short keyboard layout name (e.g. US instead of English (US)).";
    };

    running_apps_current_workspace = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Only show running apps from the current workspace.";
    };

    running_apps_group_by_app = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Group multiple windows of the same app in the running apps widget.";
    };

    running_apps_current_monitor = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Only show running apps from the current monitor.";
    };

    # ── App ID substitutions ───────────────────────────────────────────────
    app_id_substitutions = lib.mkOption {
      default = [
        {
          pattern = "Spotify";
          replacement = "spotify";
          type = "exact";
        }
        {
          pattern = "beepertexts";
          replacement = "beeper";
          type = "exact";
        }
        {
          pattern = "home assistant desktop";
          replacement = "homeassistant-desktop";
          type = "exact";
        }
        {
          pattern = "com.transmissionbt.transmission";
          replacement = "transmission-gtk";
          type = "contains";
        }
        {
          pattern = "^steam_app_(\\d+)$";
          replacement = "steam_icon_$1";
          type = "regex";
        }
      ];
      type = lib.types.listOf lib.types.anything;
      description = "Rules for resolving app IDs to icon names. type: exact | contains | regex.";
    };

    centering_mode = lib.mkOption {
      default = "index";
      type = lib.types.str;
      description = "Bar centering mode for the center widget group. Options: index, smart.";
    };

    # ── Bar configs ────────────────────────────────────────────────────────
    bar_configs = lib.mkOption {
      default = [
        {
          id = "default";
          name = "Main Bar";
          enabled = true;
          position = 0;
          screenPreferences = [ "all" ];
          showOnLastDisplay = true;
          leftWidgets = [
            "launcherButton"
            "workspaceSwitcher"
            "focusedWindow"
          ];
          centerWidgets = [
            "music"
            "clock"
            "weather"
          ];
          rightWidgets = [
            "systemTray"
            "clipboard"
            "cpuUsage"
            "memUsage"
            "dockerManager"
            "notificationButton"
            "battery"
            "controlCenterButton"
          ];
          spacing = 4;
          innerPadding = 4;
          bottomGap = 0;
          transparency = 1.0;
          widgetTransparency = 1.0;
          squareCorners = false;
          noBackground = false;
          maximizeWidgetIcons = false;
          maximizeWidgetText = false;
          removeWidgetPadding = false;
          widgetPadding = 8;
          gothCornersEnabled = false;
          gothCornerRadiusOverride = false;
          gothCornerRadiusValue = 12;
          borderEnabled = false;
          borderColor = "surfaceText";
          borderOpacity = 1.0;
          borderThickness = 1;
          widgetOutlineEnabled = false;
          widgetOutlineColor = "primary";
          widgetOutlineOpacity = 1.0;
          widgetOutlineThickness = 1;
          fontScale = 1.0;
          iconScale = 1.0;
          autoHide = false;
          autoHideDelay = 250;
          showOnWindowsOpen = false;
          openOnOverview = false;
          visible = true;
          popupGapsAuto = true;
          popupGapsManual = 4;
          maximizeDetection = true;
          scrollEnabled = true;
          scrollXBehavior = "column";
          scrollYBehavior = "workspace";
          shadowIntensity = 0;
          shadowOpacity = 60;
          shadowColorMode = "default";
          shadowCustomColor = "#000000";
          clickThrough = false;
        }
      ];
      type = lib.types.listOf lib.types.anything;
      description = "Bar configuration objects. Each entry defines a bar instance with widget layout, position, styling, and behavior.";
    };

  };
}
