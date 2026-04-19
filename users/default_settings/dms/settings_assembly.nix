# Declares the read-only _settings option and assembles all individual DMS option
# values into the camelCase JSON-ready attribute set written to
# ~/.config/DankMaterialShell/settings.json by users/users.nix.
# Defaults match upstream SettingsSpec.js (DankMaterialShell rev 4c2c193).
{ config, lib, ... }:
let
  inherit (config.eiros.system.user_defaults.dms)
    bar control_center appearance notifications dock launcher
    widgets misc media power display app_theming theme greeter lock_screen;
in
{
  options.eiros.system.user_defaults.dms._settings = lib.mkOption {
    type = lib.types.attrsOf lib.types.anything;
    readOnly = true;
    description = "Assembled DMS settings attrs written to ~/.config/DankMaterialShell/settings.json. Do not set this directly — modify the individual options above.";
  };

  config.eiros.system.user_defaults.dms._settings = {
    configVersion = 5;

    # ── Theme ────────────────────────────────────────────────────────────
    currentThemeName = theme.current_theme_name;
    currentThemeCategory = theme.current_theme_category;
    customThemeFile = theme.custom_theme_file;
    registryThemeVariants = theme.registry_theme_variants;
    matugenScheme = theme.matugen_scheme;
    matugenContrast = theme.matugen_contrast;
    runUserMatugenTemplates = theme.run_user_matugen_templates;
    matugenTargetMonitor = theme.matugen_target_monitor;

    # ── Appearance ────────────────────────────────────────────────────────
    popupTransparency = appearance.popup_transparency;
    dockTransparency = dock.transparency;
    widgetBackgroundColor = appearance.widget_background_color;
    widgetColorMode = appearance.widget_color_mode;
    controlCenterTileColorMode = control_center.tile_color_mode;
    buttonColorMode = appearance.button_color_mode;
    cornerRadius = appearance.corner_radius;

    niriLayoutGapsOverride = appearance.niri_layout_gaps_override;
    niriLayoutRadiusOverride = appearance.niri_layout_radius_override;
    niriLayoutBorderSize = appearance.niri_layout_border_size;
    hyprlandLayoutGapsOverride = appearance.hyprland_layout_gaps_override;
    hyprlandLayoutRadiusOverride = appearance.hyprland_layout_radius_override;
    hyprlandLayoutBorderSize = appearance.hyprland_layout_border_size;
    mangoLayoutGapsOverride = appearance.mango_layout_gaps_override;
    mangoLayoutRadiusOverride = appearance.mango_layout_radius_override;
    mangoLayoutBorderSize = appearance.mango_layout_border_size;

    animationSpeed = appearance.animation_speed;
    customAnimationDuration = appearance.custom_animation_duration;
    syncComponentAnimationSpeeds = appearance.sync_component_animation_speeds;
    popoutAnimationSpeed = appearance.popout_animation_speed;
    popoutCustomAnimationDuration = appearance.popout_custom_animation_duration;
    modalAnimationSpeed = appearance.modal_animation_speed;
    modalCustomAnimationDuration = appearance.modal_custom_animation_duration;
    enableRippleEffects = appearance.ripple_effects.enable;

    m3ElevationEnabled = appearance.m3_elevation.enable;
    m3ElevationIntensity = appearance.m3_elevation.intensity;
    m3ElevationOpacity = appearance.m3_elevation.opacity;
    m3ElevationColorMode = appearance.m3_elevation.color_mode;
    m3ElevationLightDirection = appearance.m3_elevation.light_direction;
    m3ElevationCustomColor = appearance.m3_elevation.custom_color;
    modalElevationEnabled = appearance.modal_elevation.enable;
    popoutElevationEnabled = appearance.popout_elevation.enable;
    barElevationEnabled = appearance.bar_elevation.enable;

    blurEnabled = appearance.blur.enable;
    blurBorderColor = appearance.blur.border_color;
    blurBorderCustomColor = appearance.blur.border_custom_color;
    blurBorderOpacity = appearance.blur.border_opacity;
    wallpaperFillMode = appearance.wallpaper_fill_mode;
    blurredWallpaperLayer = appearance.blurred_wallpaper_layer;
    blurWallpaperOnOverview = appearance.blur_wallpaper_on_overview;

    # ── Bar ───────────────────────────────────────────────────────────────
    showLauncherButton = bar.show_launcher_button;
    showWorkspaceSwitcher = bar.show_workspace_switcher;
    showFocusedWindow = bar.show_focused_window;
    showWeather = bar.show_weather;
    showMusic = bar.show_music;
    showClipboard = bar.show_clipboard;
    showCpuUsage = bar.show_cpu_usage;
    showMemUsage = bar.show_mem_usage;
    showCpuTemp = bar.show_cpu_temp;
    showGpuTemp = bar.show_gpu_temp;
    selectedGpuIndex = bar.selected_gpu_index;
    enabledGpuPciIds = bar.enabled_gpu_pci_ids;
    showSystemTray = bar.show_system_tray;
    showClock = bar.show_clock;
    showNotificationButton = bar.show_notification_button;
    showBattery = bar.show_battery;
    showControlCenterButton = bar.show_control_center_button;
    showCapsLockIndicator = bar.show_caps_lock_indicator;

    waveProgressEnabled = bar.wave_progress.enable;
    scrollTitleEnabled = bar.scroll_title.enable;
    mediaAdaptiveWidthEnabled = bar.media_adaptive_width.enable;
    audioVisualizerEnabled = bar.audio_visualizer.enable;
    audioScrollMode = bar.audio_scroll_mode;
    audioWheelScrollAmount = bar.audio_wheel_scroll_amount;
    clockCompactMode = bar.clock_compact_mode;
    focusedWindowCompactMode = bar.focused_window_compact_mode;
    runningAppsCompactMode = bar.running_apps_compact_mode;
    barMaxVisibleApps = bar.max_visible_apps;
    barMaxVisibleRunningApps = bar.max_visible_running_apps;
    barShowOverflowBadge = bar.show_overflow_badge;
    appsDockHideIndicators = bar.apps_dock_hide_indicators;
    appsDockColorizeActive = bar.apps_dock_colorize_active;
    appsDockActiveColorMode = bar.apps_dock_active_color_mode;
    appsDockEnlargeOnHover = bar.apps_dock_enlarge_on_hover;
    appsDockEnlargePercentage = bar.apps_dock_enlarge_percentage;
    appsDockIconSizePercentage = bar.apps_dock_icon_size_percentage;
    keyboardLayoutNameCompactMode = bar.keyboard_layout_name_compact_mode;
    runningAppsCurrentWorkspace = bar.running_apps_current_workspace;
    runningAppsGroupByApp = bar.running_apps_group_by_app;
    runningAppsCurrentMonitor = bar.running_apps_current_monitor;
    appIdSubstitutions = bar.app_id_substitutions;
    centeringMode = bar.centering_mode;
    barConfigs = bar.configs;

    # ── Control center ────────────────────────────────────────────────────
    controlCenterShowNetworkIcon = control_center.show_network_icon;
    controlCenterShowBluetoothIcon = control_center.show_bluetooth_icon;
    controlCenterShowAudioIcon = control_center.show_audio_icon;
    controlCenterShowAudioPercent = control_center.show_audio_percent;
    controlCenterShowVpnIcon = control_center.show_vpn_icon;
    controlCenterShowBrightnessIcon = control_center.show_brightness_icon;
    controlCenterShowBrightnessPercent = control_center.show_brightness_percent;
    controlCenterShowMicIcon = control_center.show_mic_icon;
    controlCenterShowMicPercent = control_center.show_mic_percent;
    controlCenterShowBatteryIcon = control_center.show_battery_icon;
    controlCenterShowPrinterIcon = control_center.show_printer_icon;
    controlCenterShowScreenSharingIcon = control_center.show_screen_sharing_icon;
    showPrivacyButton = control_center.show_privacy_button;
    privacyShowMicIcon = control_center.privacy_show_mic_icon;
    privacyShowCameraIcon = control_center.privacy_show_camera_icon;
    privacyShowScreenShareIcon = control_center.privacy_show_screen_share_icon;
    controlCenterWidgets = control_center.widgets;

    showWorkspaceIndex = control_center.show_workspace_index;
    showWorkspaceName = control_center.show_workspace_name;
    showWorkspacePadding = control_center.show_workspace_padding;
    workspaceScrolling = control_center.workspace_scrolling;
    showWorkspaceApps = control_center.show_workspace_apps;
    workspaceDragReorder = control_center.workspace_drag_reorder;
    maxWorkspaceIcons = control_center.max_workspace_icons;
    workspaceAppIconSizeOffset = control_center.workspace_app_icon_size_offset;
    groupWorkspaceApps = control_center.group_workspace_apps;
    workspaceFollowFocus = control_center.workspace_follow_focus;
    showOccupiedWorkspacesOnly = control_center.show_occupied_workspaces_only;
    reverseScrolling = control_center.reverse_scrolling;
    dwlShowAllTags = control_center.dwl_show_all_tags;
    workspaceActiveAppHighlightEnabled = control_center.workspace_active_app_highlight_enabled;
    workspaceColorMode = control_center.workspace_color_mode;
    workspaceOccupiedColorMode = control_center.workspace_occupied_color_mode;
    workspaceUnfocusedColorMode = control_center.workspace_unfocused_color_mode;
    workspaceUrgentColorMode = control_center.workspace_urgent_color_mode;
    workspaceFocusedBorderEnabled = control_center.workspace_focused_border_enabled;
    workspaceFocusedBorderColor = control_center.workspace_focused_border_color;
    workspaceFocusedBorderThickness = control_center.workspace_focused_border_thickness;
    workspaceNameIcons = control_center.workspace_name_icons;

    # ── Media ─────────────────────────────────────────────────────────────
    fontFamily = media.font.family;
    monoFontFamily = media.font.mono_family;
    fontWeight = media.font.weight;
    fontScale = media.font.scale;

    use24HourClock = media.clock.use_24_hour;
    showSeconds = media.clock.show_seconds;
    padHours12Hour = media.clock.pad_hours_12_hour;
    clockDateFormat = media.clock.date_format;
    lockDateFormat = media.clock.lock_date_format;
    firstDayOfWeek = media.calendar.first_day_of_week;
    showWeekNumber = media.calendar.show_week_number;
    nightModeEnabled = media.night_mode.enable;

    useFahrenheit = media.weather.use_fahrenheit;
    windSpeedUnit = media.weather.wind_speed_unit;
    useAutoLocation = media.weather.use_auto_location;
    weatherEnabled = media.weather.enable;

    mediaSize = media.player.size;

    soundsEnabled = media.sounds.enable;
    useSystemSoundTheme = media.sounds.use_system_theme;
    soundLogin = media.sounds.login;
    soundNewNotification = media.sounds.new_notification;
    soundVolumeChanged = media.sounds.volume_changed;
    soundPluggedIn = media.sounds.plugged_in;

    # ── Notifications ─────────────────────────────────────────────────────
    notificationTimeoutLow = notifications.timeout.low;
    notificationTimeoutNormal = notifications.timeout.normal;
    notificationTimeoutCritical = notifications.timeout.critical;
    notificationCompactMode = notifications.compact_mode;
    notificationPopupPosition = notifications.popup.position;
    notificationAnimationSpeed = notifications.animation_speed;
    notificationCustomAnimationDuration = notifications.custom_animation_duration;
    notificationHistoryEnabled = notifications.history.enable;
    notificationHistoryMaxCount = notifications.history.max_count;
    notificationHistoryMaxAgeDays = notifications.history.max_age_days;
    notificationHistorySaveLow = notifications.history.save_low;
    notificationHistorySaveNormal = notifications.history.save_normal;
    notificationHistorySaveCritical = notifications.history.save_critical;
    notificationRules = notifications.rules;
    notificationFocusedMonitor = notifications.focused_monitor;
    notificationOverlayEnabled = notifications.overlay.enable;
    notificationPopupShadowEnabled = notifications.popup.shadow.enable;
    notificationPopupPrivacyMode = notifications.popup.privacy_mode;

    osdAlwaysShowValue = notifications.osd.always_show_value;
    osdPosition = notifications.osd.position;
    osdVolumeEnabled = notifications.osd.volume_enabled;
    osdMediaVolumeEnabled = notifications.osd.media_volume_enabled;
    osdMediaPlaybackEnabled = notifications.osd.media_playback_enabled;
    osdBrightnessEnabled = notifications.osd.brightness_enabled;
    osdIdleInhibitorEnabled = notifications.osd.idle_inhibitor_enabled;
    osdMicMuteEnabled = notifications.osd.mic_mute_enabled;
    osdCapsLockEnabled = notifications.osd.caps_lock_enabled;
    osdPowerProfileEnabled = notifications.osd.power_profile_enabled;
    osdAudioOutputEnabled = notifications.osd.audio_output_enabled;

    # ── Lock screen ───────────────────────────────────────────────────────
    lockScreenShowPowerActions = lock_screen.show_power_actions;
    lockScreenShowSystemIcons = lock_screen.show_system_icons;
    lockScreenShowTime = lock_screen.show_time;
    lockScreenShowDate = lock_screen.show_date;
    lockScreenShowProfileImage = lock_screen.show_profile_image;
    lockScreenShowPasswordField = lock_screen.show_password_field;
    lockScreenShowMediaPlayer = lock_screen.show_media_player;
    lockScreenPowerOffMonitorsOnLock = lock_screen.power_off_monitors_on_lock;
    lockAtStartup = lock_screen.at_startup;
    lockScreenActiveMonitor = lock_screen.active_monitor;
    lockScreenInactiveColor = lock_screen.inactive_color;
    lockScreenNotificationMode = lock_screen.notification_mode;
    lockScreenVideoEnabled = lock_screen.video.enable;
    lockScreenVideoPath = lock_screen.video.path;
    lockScreenVideoCycling = lock_screen.video.cycling;
    fadeToLockEnabled = lock_screen.fade_to_lock.enable;
    fadeToLockGracePeriod = lock_screen.fade_to_lock.grace_period;
    fadeToDpmsEnabled = lock_screen.fade_to_dpms.enable;
    fadeToDpmsGracePeriod = lock_screen.fade_to_dpms.grace_period;
    enableFprint = lock_screen.fprint.enable;
    maxFprintTries = lock_screen.fprint.max_tries;
    enableU2f = lock_screen.u2f.enable;
    u2fMode = lock_screen.u2f.mode;
    hideBrightnessSlider = lock_screen.hide_brightness_slider;
    loginctlLockIntegration = lock_screen.loginctl_lock_integration;
    lockBeforeSuspend = lock_screen.lock_before_suspend;
    modalDarkenBackground = lock_screen.modal_darken_background;

    # ── Power ─────────────────────────────────────────────────────────────
    acMonitorTimeout = power.ac.monitor_timeout;
    acLockTimeout = power.ac.lock_timeout;
    acSuspendTimeout = power.ac.suspend_timeout;
    acSuspendBehavior = power.ac.suspend_behavior;
    acProfileName = power.ac.profile_name;
    acPostLockMonitorTimeout = power.ac.post_lock_monitor_timeout;
    batteryMonitorTimeout = power.battery.monitor_timeout;
    batteryLockTimeout = power.battery.lock_timeout;
    batterySuspendTimeout = power.battery.suspend_timeout;
    batterySuspendBehavior = power.battery.suspend_behavior;
    batteryProfileName = power.battery.profile_name;
    batteryPostLockMonitorTimeout = power.battery.post_lock_monitor_timeout;
    batteryChargeLimit = power.battery.charge_limit;
    powerActionConfirm = power.menu.action_confirm;
    powerActionHoldDuration = power.menu.action_hold_duration;
    powerMenuActions = power.menu.actions;
    powerMenuDefaultAction = power.menu.default_action;
    powerMenuGridLayout = power.menu.grid_layout;
    customPowerActionLock = power.custom_actions.lock;
    customPowerActionLogout = power.custom_actions.logout;
    customPowerActionSuspend = power.custom_actions.suspend;
    customPowerActionHibernate = power.custom_actions.hibernate;
    customPowerActionReboot = power.custom_actions.reboot;
    customPowerActionPowerOff = power.custom_actions.power_off;

    # ── App theming ───────────────────────────────────────────────────────
    gtkThemingEnabled = app_theming.gtk.enable;
    qtThemingEnabled = app_theming.qt.enable;
    syncModeWithPortal = app_theming.sync_mode_with_portal;
    terminalsAlwaysDark = app_theming.terminals_always_dark;
    iconTheme = app_theming.icon_theme;
    networkPreference = app_theming.network_preference;

    runDmsMatugenTemplates = app_theming.matugen.run_dms_templates;
    matugenTemplateGtk = app_theming.matugen.gtk;
    matugenTemplateNiri = app_theming.matugen.niri;
    matugenTemplateHyprland = app_theming.matugen.hyprland;
    matugenTemplateMangowc = app_theming.matugen.mangowc;
    matugenTemplateQt5ct = app_theming.matugen.qt5ct;
    matugenTemplateQt6ct = app_theming.matugen.qt6ct;
    matugenTemplateFirefox = app_theming.matugen.firefox;
    matugenTemplatePywalfox = app_theming.matugen.pywalfox;
    matugenTemplateZenBrowser = app_theming.matugen.zen_browser;
    matugenTemplateVesktop = app_theming.matugen.vesktop;
    matugenTemplateEquibop = app_theming.matugen.equibop;
    matugenTemplateGhostty = app_theming.matugen.ghostty;
    matugenTemplateKitty = app_theming.matugen.kitty;
    matugenTemplateFoot = app_theming.matugen.foot;
    matugenTemplateAlacritty = app_theming.matugen.alacritty;
    matugenTemplateNeovim = app_theming.matugen.neovim;
    matugenTemplateWezterm = app_theming.matugen.wezterm;
    matugenTemplateDgop = app_theming.matugen.dgop;
    matugenTemplateKcolorscheme = app_theming.matugen.kcolorscheme;
    matugenTemplateVscode = app_theming.matugen.vscode;
    matugenTemplateEmacs = app_theming.matugen.emacs;
    matugenTemplateZed = app_theming.matugen.zed;
    matugenTemplateNeovimSettings = app_theming.matugen.neovim_settings;
    matugenTemplateNeovimSetBackground = app_theming.matugen.neovim_set_background;

    # ── Dock ──────────────────────────────────────────────────────────────
    showDock = dock.enable;
    dockAutoHide = dock.auto_hide;
    dockSmartAutoHide = dock.smart_auto_hide;
    dockGroupByApp = dock.group_by_app;
    dockRestoreSpecialWorkspaceOnClick = dock.restore_special_workspace_on_click;
    dockOpenOnOverview = dock.open_on_overview;
    dockPosition = dock.position;
    dockSpacing = dock.spacing;
    dockBottomGap = dock.bottom_gap;
    dockMargin = dock.margin;
    dockIconSize = dock.icon_size;
    dockIndicatorStyle = dock.indicator_style;
    dockBorderEnabled = dock.border.enable;
    dockBorderColor = dock.border.color;
    dockBorderOpacity = dock.border.opacity;
    dockBorderThickness = dock.border.thickness;
    dockIsolateDisplays = dock.isolate_displays;
    dockLauncherEnabled = dock.launcher.enable;
    dockLauncherLogoMode = dock.launcher.logo.mode;
    dockLauncherLogoCustomPath = dock.launcher.logo.custom_path;
    dockLauncherLogoColorOverride = dock.launcher.logo.color_override;
    dockLauncherLogoSizeOffset = dock.launcher.logo.size_offset;
    dockLauncherLogoBrightness = dock.launcher.logo.brightness;
    dockLauncherLogoContrast = dock.launcher.logo.contrast;
    dockMaxVisibleApps = dock.max_visible_apps;
    dockMaxVisibleRunningApps = dock.max_visible_running_apps;
    dockShowOverflowBadge = dock.show_overflow_badge;

    # ── Launcher ──────────────────────────────────────────────────────────
    appLauncherViewMode = launcher.view_mode;
    spotlightModalViewMode = launcher.spotlight_view_mode;
    browserPickerViewMode = launcher.browser_picker_view_mode;
    browserUsageHistory = launcher.browser_usage_history;
    appPickerViewMode = launcher.app_picker_view_mode;
    filePickerUsageHistory = launcher.file_picker_usage_history;
    sortAppsAlphabetically = launcher.sort_apps_alphabetically;
    appLauncherGridColumns = launcher.grid_columns;
    spotlightCloseNiriOverview = launcher.spotlight_close_niri_overview;
    rememberLastQuery = launcher.remember_last_query;
    spotlightSectionViewModes = launcher.spotlight_section_view_modes;
    appDrawerSectionViewModes = launcher.drawer_section_view_modes;
    niriOverviewOverlayEnabled = launcher.niri_overview_overlay.enable;
    dankLauncherV2Size = launcher.v2.size;
    dankLauncherV2BorderEnabled = launcher.v2.border.enable;
    dankLauncherV2BorderThickness = launcher.v2.border.thickness;
    dankLauncherV2BorderColor = launcher.v2.border.color;
    dankLauncherV2ShowFooter = launcher.v2.show_footer;
    dankLauncherV2UnloadOnClose = launcher.v2.unload_on_close;
    dankLauncherV2IncludeFilesInAll = launcher.v2.include_files_in_all;
    dankLauncherV2IncludeFoldersInAll = launcher.v2.include_folders_in_all;
    launcherLogoMode = launcher.logo.mode;
    launcherLogoCustomPath = launcher.logo.custom_path;
    launcherLogoColorOverride = launcher.logo.color_override;
    launcherLogoColorInvertOnMode = launcher.logo.color_invert_on_mode;
    launcherLogoBrightness = launcher.logo.brightness;
    launcherLogoContrast = launcher.logo.contrast;
    launcherLogoSizeOffset = launcher.logo.size_offset;

    # ── Greeter ───────────────────────────────────────────────────────────
    greeterRememberLastSession = greeter.remember_last_session;
    greeterRememberLastUser = greeter.remember_last_user;
    greeterEnableFprint = greeter.fprint.enable;
    greeterEnableU2f = greeter.u2f.enable;
    greeterWallpaperPath = greeter.wallpaper_path;
    greeterUse24HourClock = greeter.use_24_hour_clock;
    greeterShowSeconds = greeter.show_seconds;
    greeterPadHours12Hour = greeter.pad_hours_12_hour;
    greeterLockDateFormat = greeter.lock_date_format;
    greeterFontFamily = greeter.font_family;
    greeterWallpaperFillMode = greeter.wallpaper_fill_mode;

    # ── Widgets ───────────────────────────────────────────────────────────
    notepadUseMonospace = widgets.notepad.use_monospace;
    notepadFontFamily = widgets.notepad.font_family;
    notepadFontSize = widgets.notepad.font_size;
    notepadShowLineNumbers = widgets.notepad.show_line_numbers;
    notepadTransparencyOverride = widgets.notepad.transparency_override;
    notepadLastCustomTransparency = widgets.notepad.last_custom_transparency;

    desktopClockEnabled = widgets.desktop_clock.enable;
    desktopClockStyle = widgets.desktop_clock.style;
    desktopClockTransparency = widgets.desktop_clock.transparency;
    desktopClockColorMode = widgets.desktop_clock.color_mode;
    desktopClockCustomColor = widgets.desktop_clock.custom_color;
    desktopClockShowDate = widgets.desktop_clock.show_date;
    desktopClockShowAnalogNumbers = widgets.desktop_clock.show_analog_numbers;
    desktopClockShowAnalogSeconds = widgets.desktop_clock.show_analog_seconds;
    desktopClockX = widgets.desktop_clock.x;
    desktopClockY = widgets.desktop_clock.y;
    desktopClockWidth = widgets.desktop_clock.width;
    desktopClockHeight = widgets.desktop_clock.height;
    desktopClockDisplayPreferences = widgets.desktop_clock.display_preferences;

    systemMonitorEnabled = widgets.system_monitor.enable;
    systemMonitorShowHeader = widgets.system_monitor.show_header;
    systemMonitorTransparency = widgets.system_monitor.transparency;
    systemMonitorColorMode = widgets.system_monitor.color_mode;
    systemMonitorCustomColor = widgets.system_monitor.custom_color;
    systemMonitorShowCpu = widgets.system_monitor.show_cpu;
    systemMonitorShowCpuGraph = widgets.system_monitor.show_cpu_graph;
    systemMonitorShowCpuTemp = widgets.system_monitor.show_cpu_temp;
    systemMonitorShowGpuTemp = widgets.system_monitor.show_gpu_temp;
    systemMonitorGpuPciId = widgets.system_monitor.gpu_pci_id;
    systemMonitorShowMemory = widgets.system_monitor.show_memory;
    systemMonitorShowMemoryGraph = widgets.system_monitor.show_memory_graph;
    systemMonitorShowNetwork = widgets.system_monitor.show_network;
    systemMonitorShowNetworkGraph = widgets.system_monitor.show_network_graph;
    systemMonitorShowDisk = widgets.system_monitor.show_disk;
    systemMonitorShowTopProcesses = widgets.system_monitor.show_top_processes;
    systemMonitorTopProcessCount = widgets.system_monitor.top_process_count;
    systemMonitorTopProcessSortBy = widgets.system_monitor.top_process_sort_by;
    systemMonitorGraphInterval = widgets.system_monitor.graph_interval;
    systemMonitorLayoutMode = widgets.system_monitor.layout_mode;
    systemMonitorX = widgets.system_monitor.x;
    systemMonitorY = widgets.system_monitor.y;
    systemMonitorWidth = widgets.system_monitor.width;
    systemMonitorHeight = widgets.system_monitor.height;
    systemMonitorDisplayPreferences = widgets.system_monitor.display_preferences;
    systemMonitorVariants = widgets.system_monitor.variants;

    desktopWidgetPositions = widgets.desktop.widget_positions;
    desktopWidgetGridSettings = widgets.desktop.widget_grid_settings;
    desktopWidgetInstances = widgets.desktop.widget_instances;
    desktopWidgetGroups = widgets.desktop.widget_groups;

    # ── Misc ──────────────────────────────────────────────────────────────
    cursorSettings = misc.cursor_settings;

    muxType = misc.mux.type;
    muxUseCustomCommand = misc.mux.use_custom_command;
    muxCustomCommand = misc.mux.custom_command;
    muxSessionFilter = misc.mux.session_filter;

    launchPrefix = misc.launch_prefix;

    updaterHideWidget = misc.updater.hide_widget;
    updaterUseCustomCommand = misc.updater.use_custom_command;
    updaterCustomCommand = misc.updater.custom_command;
    updaterTerminalAdditionalParams = misc.updater.terminal_additional_params;

    builtInPluginSettings = misc.built_in_plugin_settings;
    clipboardEnterToPaste = misc.clipboard_enter_to_paste;
    launcherPluginVisibility = misc.launcher_plugin_visibility;
    launcherPluginOrder = misc.launcher_plugin_order;

    brightnessDevicePins = misc.brightness_device_pins;
    wifiNetworkPins = misc.wifi_network_pins;
    bluetoothDevicePins = misc.bluetooth_device_pins;
    audioInputDevicePins = misc.audio_input_device_pins;
    audioOutputDevicePins = misc.audio_output_device_pins;

    # ── Display ───────────────────────────────────────────────────────────
    displayNameMode = display.name_mode;
    screenPreferences = display.screen_preferences;
    showOnLastDisplay = display.show_on_last_display;
    niriOutputSettings = display.niri_output_settings;
    hyprlandOutputSettings = display.hyprland_output_settings;
    displayProfiles = display.profiles;
    activeDisplayProfile = display.active_profile;
    displayProfileAutoSelect = display.profile_auto_select;
    displayShowDisconnected = display.show_disconnected;
    displaySnapToEdge = display.snap_to_edge;
  };
}
