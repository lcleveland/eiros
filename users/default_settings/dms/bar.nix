# DMS bar options: widget visibility, widget behavior, app ID substitutions,
# centering mode, and bar instance configurations.
{ lib, ... }:
let
  defaultBarConfig = {
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
  };
in
{
  options.eiros.system.user_defaults.dms.bar = {

    # ── Bar widget visibility ──────────────────────────────────────────────
    show_launcher_button = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the app launcher button in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_launcher_button = false;
        }
      '';
    };

    show_workspace_switcher = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the workspace switcher in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_workspace_switcher = false;
        }
      '';
    };

    show_focused_window = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the focused window title/icon in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_focused_window = false;
        }
      '';
    };

    show_weather = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the weather widget in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_weather = false;
        }
      '';
    };

    show_music = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the media player widget in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_music = false;
        }
      '';
    };

    show_clipboard = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the clipboard history widget in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_clipboard = false;
        }
      '';
    };

    show_cpu_usage = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the CPU usage widget in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_cpu_usage = false;
        }
      '';
    };

    show_mem_usage = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the memory usage widget in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_mem_usage = false;
        }
      '';
    };

    show_cpu_temp = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the CPU temperature widget in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_cpu_temp = false;
        }
      '';
    };

    show_gpu_temp = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the GPU temperature widget in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_gpu_temp = false;
        }
      '';
    };

    show_system_tray = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the system tray in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_system_tray = false;
        }
      '';
    };

    show_clock = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the clock widget in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_clock = false;
        }
      '';
    };

    show_notification_button = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the notification center toggle button in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_notification_button = false;
        }
      '';
    };

    show_battery = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the battery indicator in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_battery = false;
        }
      '';
    };

    show_control_center_button = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the control center toggle button in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_control_center_button = false;
        }
      '';
    };

    show_caps_lock_indicator = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the caps lock indicator in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_caps_lock_indicator = false;
        }
      '';
    };

    selected_gpu_index = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Index of the GPU to display temperature for (0-based).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.selected_gpu_index = 1;
        }
      '';
    };

    enabled_gpu_pci_ids = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
      description = "PCI IDs of GPUs to include in monitoring widgets.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.enabled_gpu_pci_ids = [ "10de:2204" ];
        }
      '';
    };

    # ── Bar widget behavior ────────────────────────────────────────────────
    wave_progress.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enable the wave progress animation on the media player widget.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.wave_progress.enable = false;
        }
      '';
    };

    scroll_title.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enable scrolling for long window titles in the focused window widget.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.scroll_title.enable = false;
        }
      '';
    };

    media_adaptive_width.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Let the media player widget adapt its width to content.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.media_adaptive_width.enable = false;
        }
      '';
    };

    audio_visualizer.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show an audio waveform visualizer in the media player widget.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.audio_visualizer.enable = false;
        }
      '';
    };

    audio_scroll_mode = lib.mkOption {
      default = "volume";
      type = lib.types.str;
      description = "What scrolling on the audio widget controls. Options: volume, seek.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.audio_scroll_mode = "seek";
        }
      '';
    };

    audio_wheel_scroll_amount = lib.mkOption {
      default = 5;
      type = lib.types.int;
      description = "Volume change per scroll step (percent).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.audio_wheel_scroll_amount = 2;
        }
      '';
    };

    clock_compact_mode = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Compact clock mode (time only, no date).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.clock_compact_mode = true;
        }
      '';
    };

    focused_window_compact_mode = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Compact focused window widget (icon only, no title).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.focused_window_compact_mode = true;
        }
      '';
    };

    running_apps_compact_mode = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Compact running apps widget (icons only, no labels).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.running_apps_compact_mode = false;
        }
      '';
    };

    max_visible_apps = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Maximum pinned apps shown in the bar. 0 = unlimited.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.max_visible_apps = 5;
        }
      '';
    };

    max_visible_running_apps = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Maximum running apps shown in the bar. 0 = unlimited.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.max_visible_running_apps = 8;
        }
      '';
    };

    show_overflow_badge = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show an overflow badge when the app limit is exceeded.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.show_overflow_badge = false;
        }
      '';
    };

    apps_dock_hide_indicators = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Hide running/open indicators on dock and bar app icons.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.apps_dock_hide_indicators = true;
        }
      '';
    };

    apps_dock_colorize_active = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Colorize the active app indicator.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.apps_dock_colorize_active = true;
        }
      '';
    };

    apps_dock_active_color_mode = lib.mkOption {
      default = "primary";
      type = lib.types.str;
      description = "Color mode for the active app indicator.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.apps_dock_active_color_mode = "secondary";
        }
      '';
    };

    apps_dock_enlarge_on_hover = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enlarge dock/bar app icons on hover.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.apps_dock_enlarge_on_hover = true;
        }
      '';
    };

    apps_dock_enlarge_percentage = lib.mkOption {
      default = 125;
      type = lib.types.int;
      description = "Hover enlargement percentage for app icons.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.apps_dock_enlarge_percentage = 150;
        }
      '';
    };

    apps_dock_icon_size_percentage = lib.mkOption {
      default = 100;
      type = lib.types.int;
      description = "Base icon size as a percentage of the default.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.apps_dock_icon_size_percentage = 80;
        }
      '';
    };

    keyboard_layout_name_compact_mode = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show short keyboard layout name (e.g. US instead of English (US)).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.keyboard_layout_name_compact_mode = true;
        }
      '';
    };

    running_apps_current_workspace = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Only show running apps from the current workspace.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.running_apps_current_workspace = false;
        }
      '';
    };

    running_apps_group_by_app = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Group multiple windows of the same app in the running apps widget.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.running_apps_group_by_app = true;
        }
      '';
    };

    running_apps_current_monitor = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Only show running apps from the current monitor.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.running_apps_current_monitor = true;
        }
      '';
    };

    # ── App ID substitutions ───────────────────────────────────────────────
    app_id_substitutions = lib.mkOption {
      default = [
        { pattern = "Spotify"; replacement = "spotify"; type = "exact"; }
        { pattern = "beepertexts"; replacement = "beeper"; type = "exact"; }
        { pattern = "home assistant desktop"; replacement = "homeassistant-desktop"; type = "exact"; }
        { pattern = "com.transmissionbt.transmission"; replacement = "transmission-gtk"; type = "contains"; }
        { pattern = "^steam_app_(\\d+)$"; replacement = "steam_icon_$1"; type = "regex"; }
      ];
      type = lib.types.listOf lib.types.anything;
      description = "Rules for resolving app IDs to icon names. type: exact | contains | regex.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.app_id_substitutions = [
            { pattern = "MyApp"; replacement = "myapp"; type = "exact"; }
          ];
        }
      '';
    };

    centering_mode = lib.mkOption {
      default = "index";
      type = lib.types.str;
      description = "Bar centering mode for the center widget group. Options: index, smart.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.centering_mode = "smart";
        }
      '';
    };

    # ── Bar configs ────────────────────────────────────────────────────────
    configs = lib.mkOption {
      default = [ defaultBarConfig ];
      type = lib.types.listOf lib.types.anything;
      description = "Bar configuration objects. Each entry defines a bar instance with widget layout, position, styling, and behavior.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.bar.configs = [
            { id = "main"; name = "Main Bar"; enabled = true; position = 0; }
          ];
        }
      '';
    };

  };
}
