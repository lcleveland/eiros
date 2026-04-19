# Declares the read-only _settings option and assembles all individual DMS option
# values into the camelCase JSON-ready attribute set written to
# ~/.config/DankMaterialShell/settings.json by users/users.nix.
# Defaults match upstream SettingsSpec.js (DankMaterialShell rev 4c2c193).
{ config, lib, ... }:
let
  cfg = config.eiros.system.user_defaults.dms;
in
{
  options.eiros.system.user_defaults.dms._settings = lib.mkOption {
    type = lib.types.attrsOf lib.types.anything;
    readOnly = true;
    description = "Assembled DMS settings attrs written to ~/.config/DankMaterialShell/settings.json. Do not set this directly — modify the individual options above.";
  };

  config.eiros.system.user_defaults.dms._settings = {
    configVersion = 5;

    currentThemeName = cfg.current_theme_name;
    currentThemeCategory = cfg.current_theme_category;
    customThemeFile = cfg.custom_theme_file;
    registryThemeVariants = cfg.registry_theme_variants;
    matugenScheme = cfg.matugen_scheme;
    matugenContrast = cfg.matugen_contrast;
    runUserMatugenTemplates = cfg.run_user_matugen_templates;
    matugenTargetMonitor = cfg.matugen_target_monitor;

    popupTransparency = cfg.popup_transparency;
    dockTransparency = cfg.dock_transparency;
    widgetBackgroundColor = cfg.widget_background_color;
    widgetColorMode = cfg.widget_color_mode;
    controlCenterTileColorMode = cfg.control_center_tile_color_mode;
    buttonColorMode = cfg.button_color_mode;
    cornerRadius = cfg.corner_radius;

    niriLayoutGapsOverride = cfg.niri_layout_gaps_override;
    niriLayoutRadiusOverride = cfg.niri_layout_radius_override;
    niriLayoutBorderSize = cfg.niri_layout_border_size;
    hyprlandLayoutGapsOverride = cfg.hyprland_layout_gaps_override;
    hyprlandLayoutRadiusOverride = cfg.hyprland_layout_radius_override;
    hyprlandLayoutBorderSize = cfg.hyprland_layout_border_size;
    mangoLayoutGapsOverride = cfg.mango_layout_gaps_override;
    mangoLayoutRadiusOverride = cfg.mango_layout_radius_override;
    mangoLayoutBorderSize = cfg.mango_layout_border_size;

    animationSpeed = cfg.animation_speed;
    customAnimationDuration = cfg.custom_animation_duration;
    syncComponentAnimationSpeeds = cfg.sync_component_animation_speeds;
    popoutAnimationSpeed = cfg.popout_animation_speed;
    popoutCustomAnimationDuration = cfg.popout_custom_animation_duration;
    modalAnimationSpeed = cfg.modal_animation_speed;
    modalCustomAnimationDuration = cfg.modal_custom_animation_duration;
    enableRippleEffects = cfg.enable_ripple_effects;

    m3ElevationEnabled = cfg.m3_elevation_enabled;
    m3ElevationIntensity = cfg.m3_elevation_intensity;
    m3ElevationOpacity = cfg.m3_elevation_opacity;
    m3ElevationColorMode = cfg.m3_elevation_color_mode;
    m3ElevationLightDirection = cfg.m3_elevation_light_direction;
    m3ElevationCustomColor = cfg.m3_elevation_custom_color;
    modalElevationEnabled = cfg.modal_elevation_enabled;
    popoutElevationEnabled = cfg.popout_elevation_enabled;
    barElevationEnabled = cfg.bar_elevation_enabled;

    blurEnabled = cfg.blur_enabled;
    blurBorderColor = cfg.blur_border_color;
    blurBorderCustomColor = cfg.blur_border_custom_color;
    blurBorderOpacity = cfg.blur_border_opacity;
    wallpaperFillMode = cfg.wallpaper_fill_mode;
    blurredWallpaperLayer = cfg.blurred_wallpaper_layer;
    blurWallpaperOnOverview = cfg.blur_wallpaper_on_overview;

    showLauncherButton = cfg.show_launcher_button;
    showWorkspaceSwitcher = cfg.show_workspace_switcher;
    showFocusedWindow = cfg.show_focused_window;
    showWeather = cfg.show_weather;
    showMusic = cfg.show_music;
    showClipboard = cfg.show_clipboard;
    showCpuUsage = cfg.show_cpu_usage;
    showMemUsage = cfg.show_mem_usage;
    showCpuTemp = cfg.show_cpu_temp;
    showGpuTemp = cfg.show_gpu_temp;
    selectedGpuIndex = cfg.selected_gpu_index;
    enabledGpuPciIds = cfg.enabled_gpu_pci_ids;
    showSystemTray = cfg.show_system_tray;
    showClock = cfg.show_clock;
    showNotificationButton = cfg.show_notification_button;
    showBattery = cfg.show_battery;
    showControlCenterButton = cfg.show_control_center_button;
    showCapsLockIndicator = cfg.show_caps_lock_indicator;

    controlCenterShowNetworkIcon = cfg.control_center_show_network_icon;
    controlCenterShowBluetoothIcon = cfg.control_center_show_bluetooth_icon;
    controlCenterShowAudioIcon = cfg.control_center_show_audio_icon;
    controlCenterShowAudioPercent = cfg.control_center_show_audio_percent;
    controlCenterShowVpnIcon = cfg.control_center_show_vpn_icon;
    controlCenterShowBrightnessIcon = cfg.control_center_show_brightness_icon;
    controlCenterShowBrightnessPercent = cfg.control_center_show_brightness_percent;
    controlCenterShowMicIcon = cfg.control_center_show_mic_icon;
    controlCenterShowMicPercent = cfg.control_center_show_mic_percent;
    controlCenterShowBatteryIcon = cfg.control_center_show_battery_icon;
    controlCenterShowPrinterIcon = cfg.control_center_show_printer_icon;
    controlCenterShowScreenSharingIcon = cfg.control_center_show_screen_sharing_icon;
    showPrivacyButton = cfg.show_privacy_button;
    privacyShowMicIcon = cfg.privacy_show_mic_icon;
    privacyShowCameraIcon = cfg.privacy_show_camera_icon;
    privacyShowScreenShareIcon = cfg.privacy_show_screen_share_icon;
    controlCenterWidgets = cfg.control_center_widgets;

    showWorkspaceIndex = cfg.show_workspace_index;
    showWorkspaceName = cfg.show_workspace_name;
    showWorkspacePadding = cfg.show_workspace_padding;
    workspaceScrolling = cfg.workspace_scrolling;
    showWorkspaceApps = cfg.show_workspace_apps;
    workspaceDragReorder = cfg.workspace_drag_reorder;
    maxWorkspaceIcons = cfg.max_workspace_icons;
    workspaceAppIconSizeOffset = cfg.workspace_app_icon_size_offset;
    groupWorkspaceApps = cfg.group_workspace_apps;
    workspaceFollowFocus = cfg.workspace_follow_focus;
    showOccupiedWorkspacesOnly = cfg.show_occupied_workspaces_only;
    reverseScrolling = cfg.reverse_scrolling;
    dwlShowAllTags = cfg.dwl_show_all_tags;
    workspaceActiveAppHighlightEnabled = cfg.workspace_active_app_highlight_enabled;
    workspaceColorMode = cfg.workspace_color_mode;
    workspaceOccupiedColorMode = cfg.workspace_occupied_color_mode;
    workspaceUnfocusedColorMode = cfg.workspace_unfocused_color_mode;
    workspaceUrgentColorMode = cfg.workspace_urgent_color_mode;
    workspaceFocusedBorderEnabled = cfg.workspace_focused_border_enabled;
    workspaceFocusedBorderColor = cfg.workspace_focused_border_color;
    workspaceFocusedBorderThickness = cfg.workspace_focused_border_thickness;
    workspaceNameIcons = cfg.workspace_name_icons;

    waveProgressEnabled = cfg.wave_progress_enabled;
    scrollTitleEnabled = cfg.scroll_title_enabled;
    mediaAdaptiveWidthEnabled = cfg.media_adaptive_width_enabled;
    audioVisualizerEnabled = cfg.audio_visualizer_enabled;
    audioScrollMode = cfg.audio_scroll_mode;
    audioWheelScrollAmount = cfg.audio_wheel_scroll_amount;
    clockCompactMode = cfg.clock_compact_mode;
    focusedWindowCompactMode = cfg.focused_window_compact_mode;
    runningAppsCompactMode = cfg.running_apps_compact_mode;
    barMaxVisibleApps = cfg.bar_max_visible_apps;
    barMaxVisibleRunningApps = cfg.bar_max_visible_running_apps;
    barShowOverflowBadge = cfg.bar_show_overflow_badge;
    appsDockHideIndicators = cfg.apps_dock_hide_indicators;
    appsDockColorizeActive = cfg.apps_dock_colorize_active;
    appsDockActiveColorMode = cfg.apps_dock_active_color_mode;
    appsDockEnlargeOnHover = cfg.apps_dock_enlarge_on_hover;
    appsDockEnlargePercentage = cfg.apps_dock_enlarge_percentage;
    appsDockIconSizePercentage = cfg.apps_dock_icon_size_percentage;
    keyboardLayoutNameCompactMode = cfg.keyboard_layout_name_compact_mode;
    runningAppsCurrentWorkspace = cfg.running_apps_current_workspace;
    runningAppsGroupByApp = cfg.running_apps_group_by_app;
    runningAppsCurrentMonitor = cfg.running_apps_current_monitor;

    appIdSubstitutions = cfg.app_id_substitutions;
    centeringMode = cfg.centering_mode;
    barConfigs = cfg.bar_configs;

    fontFamily = cfg.font_family;
    monoFontFamily = cfg.mono_font_family;
    fontWeight = cfg.font_weight;
    fontScale = cfg.font_scale;

    use24HourClock = cfg.use24_hour_clock;
    showSeconds = cfg.show_seconds;
    padHours12Hour = cfg.pad_hours12_hour;
    clockDateFormat = cfg.clock_date_format;
    lockDateFormat = cfg.lock_date_format;
    firstDayOfWeek = cfg.first_day_of_week;
    showWeekNumber = cfg.show_week_number;
    nightModeEnabled = cfg.night_mode_enabled;

    useFahrenheit = cfg.use_fahrenheit;
    windSpeedUnit = cfg.wind_speed_unit;
    useAutoLocation = cfg.use_auto_location;
    weatherEnabled = cfg.weather_enabled;

    mediaSize = cfg.media_size;

    soundsEnabled = cfg.sounds_enabled;
    useSystemSoundTheme = cfg.use_system_sound_theme;
    soundLogin = cfg.sound_login;
    soundNewNotification = cfg.sound_new_notification;
    soundVolumeChanged = cfg.sound_volume_changed;
    soundPluggedIn = cfg.sound_plugged_in;

    notificationTimeoutLow = cfg.notification_timeout_low;
    notificationTimeoutNormal = cfg.notification_timeout_normal;
    notificationTimeoutCritical = cfg.notification_timeout_critical;
    notificationCompactMode = cfg.notification_compact_mode;
    notificationPopupPosition = cfg.notification_popup_position;
    notificationAnimationSpeed = cfg.notification_animation_speed;
    notificationCustomAnimationDuration = cfg.notification_custom_animation_duration;
    notificationHistoryEnabled = cfg.notification_history_enabled;
    notificationHistoryMaxCount = cfg.notification_history_max_count;
    notificationHistoryMaxAgeDays = cfg.notification_history_max_age_days;
    notificationHistorySaveLow = cfg.notification_history_save_low;
    notificationHistorySaveNormal = cfg.notification_history_save_normal;
    notificationHistorySaveCritical = cfg.notification_history_save_critical;
    notificationRules = cfg.notification_rules;
    notificationFocusedMonitor = cfg.notification_focused_monitor;
    notificationOverlayEnabled = cfg.notification_overlay_enabled;
    notificationPopupShadowEnabled = cfg.notification_popup_shadow_enabled;
    notificationPopupPrivacyMode = cfg.notification_popup_privacy_mode;

    osdAlwaysShowValue = cfg.osd_always_show_value;
    osdPosition = cfg.osd_position;
    osdVolumeEnabled = cfg.osd_volume_enabled;
    osdMediaVolumeEnabled = cfg.osd_media_volume_enabled;
    osdMediaPlaybackEnabled = cfg.osd_media_playback_enabled;
    osdBrightnessEnabled = cfg.osd_brightness_enabled;
    osdIdleInhibitorEnabled = cfg.osd_idle_inhibitor_enabled;
    osdMicMuteEnabled = cfg.osd_mic_mute_enabled;
    osdCapsLockEnabled = cfg.osd_caps_lock_enabled;
    osdPowerProfileEnabled = cfg.osd_power_profile_enabled;
    osdAudioOutputEnabled = cfg.osd_audio_output_enabled;

    lockScreenShowPowerActions = cfg.lock_screen_show_power_actions;
    lockScreenShowSystemIcons = cfg.lock_screen_show_system_icons;
    lockScreenShowTime = cfg.lock_screen_show_time;
    lockScreenShowDate = cfg.lock_screen_show_date;
    lockScreenShowProfileImage = cfg.lock_screen_show_profile_image;
    lockScreenShowPasswordField = cfg.lock_screen_show_password_field;
    lockScreenShowMediaPlayer = cfg.lock_screen_show_media_player;
    lockScreenPowerOffMonitorsOnLock = cfg.lock_screen_power_off_monitors_on_lock;
    lockAtStartup = cfg.lock_at_startup;
    lockScreenActiveMonitor = cfg.lock_screen_active_monitor;
    lockScreenInactiveColor = cfg.lock_screen_inactive_color;
    lockScreenNotificationMode = cfg.lock_screen_notification_mode;
    lockScreenVideoEnabled = cfg.lock_screen_video_enabled;
    lockScreenVideoPath = cfg.lock_screen_video_path;
    lockScreenVideoCycling = cfg.lock_screen_video_cycling;
    fadeToLockEnabled = cfg.fade_to_lock_enabled;
    fadeToLockGracePeriod = cfg.fade_to_lock_grace_period;
    fadeToDpmsEnabled = cfg.fade_to_dpms_enabled;
    fadeToDpmsGracePeriod = cfg.fade_to_dpms_grace_period;
    enableFprint = cfg.enable_fprint;
    maxFprintTries = cfg.max_fprint_tries;
    enableU2f = cfg.enable_u2f;
    u2fMode = cfg.u2f_mode;
    hideBrightnessSlider = cfg.hide_brightness_slider;
    loginctlLockIntegration = cfg.loginctl_lock_integration;
    lockBeforeSuspend = cfg.lock_before_suspend;
    modalDarkenBackground = cfg.modal_darken_background;

    acMonitorTimeout = cfg.ac_monitor_timeout;
    acLockTimeout = cfg.ac_lock_timeout;
    acSuspendTimeout = cfg.ac_suspend_timeout;
    acSuspendBehavior = cfg.ac_suspend_behavior;
    acProfileName = cfg.ac_profile_name;
    acPostLockMonitorTimeout = cfg.ac_post_lock_monitor_timeout;
    batteryMonitorTimeout = cfg.battery_monitor_timeout;
    batteryLockTimeout = cfg.battery_lock_timeout;
    batterySuspendTimeout = cfg.battery_suspend_timeout;
    batterySuspendBehavior = cfg.battery_suspend_behavior;
    batteryProfileName = cfg.battery_profile_name;
    batteryPostLockMonitorTimeout = cfg.battery_post_lock_monitor_timeout;
    batteryChargeLimit = cfg.battery_charge_limit;

    powerActionConfirm = cfg.power_action_confirm;
    powerActionHoldDuration = cfg.power_action_hold_duration;
    powerMenuActions = cfg.power_menu_actions;
    powerMenuDefaultAction = cfg.power_menu_default_action;
    powerMenuGridLayout = cfg.power_menu_grid_layout;
    customPowerActionLock = cfg.custom_power_action_lock;
    customPowerActionLogout = cfg.custom_power_action_logout;
    customPowerActionSuspend = cfg.custom_power_action_suspend;
    customPowerActionHibernate = cfg.custom_power_action_hibernate;
    customPowerActionReboot = cfg.custom_power_action_reboot;
    customPowerActionPowerOff = cfg.custom_power_action_power_off;

    gtkThemingEnabled = cfg.gtk_theming_enabled;
    qtThemingEnabled = cfg.qt_theming_enabled;
    syncModeWithPortal = cfg.sync_mode_with_portal;
    terminalsAlwaysDark = cfg.terminals_always_dark;
    iconTheme = cfg.icon_theme;
    networkPreference = cfg.network_preference;

    runDmsMatugenTemplates = cfg.run_dms_matugen_templates;
    matugenTemplateGtk = cfg.matugen_template_gtk;
    matugenTemplateNiri = cfg.matugen_template_niri;
    matugenTemplateHyprland = cfg.matugen_template_hyprland;
    matugenTemplateMangowc = cfg.matugen_template_mangowc;
    matugenTemplateQt5ct = cfg.matugen_template_qt5ct;
    matugenTemplateQt6ct = cfg.matugen_template_qt6ct;
    matugenTemplateFirefox = cfg.matugen_template_firefox;
    matugenTemplatePywalfox = cfg.matugen_template_pywalfox;
    matugenTemplateZenBrowser = cfg.matugen_template_zen_browser;
    matugenTemplateVesktop = cfg.matugen_template_vesktop;
    matugenTemplateEquibop = cfg.matugen_template_equibop;
    matugenTemplateGhostty = cfg.matugen_template_ghostty;
    matugenTemplateKitty = cfg.matugen_template_kitty;
    matugenTemplateFoot = cfg.matugen_template_foot;
    matugenTemplateAlacritty = cfg.matugen_template_alacritty;
    matugenTemplateNeovim = cfg.matugen_template_neovim;
    matugenTemplateWezterm = cfg.matugen_template_wezterm;
    matugenTemplateDgop = cfg.matugen_template_dgop;
    matugenTemplateKcolorscheme = cfg.matugen_template_kcolorscheme;
    matugenTemplateVscode = cfg.matugen_template_vscode;
    matugenTemplateEmacs = cfg.matugen_template_emacs;
    matugenTemplateZed = cfg.matugen_template_zed;
    matugenTemplateNeovimSettings = cfg.matugen_template_neovim_settings;
    matugenTemplateNeovimSetBackground = cfg.matugen_template_neovim_set_background;

    showDock = cfg.show_dock;
    dockAutoHide = cfg.dock_auto_hide;
    dockSmartAutoHide = cfg.dock_smart_auto_hide;
    dockGroupByApp = cfg.dock_group_by_app;
    dockRestoreSpecialWorkspaceOnClick = cfg.dock_restore_special_workspace_on_click;
    dockOpenOnOverview = cfg.dock_open_on_overview;
    dockPosition = cfg.dock_position;
    dockSpacing = cfg.dock_spacing;
    dockBottomGap = cfg.dock_bottom_gap;
    dockMargin = cfg.dock_margin;
    dockIconSize = cfg.dock_icon_size;
    dockIndicatorStyle = cfg.dock_indicator_style;
    dockBorderEnabled = cfg.dock_border_enabled;
    dockBorderColor = cfg.dock_border_color;
    dockBorderOpacity = cfg.dock_border_opacity;
    dockBorderThickness = cfg.dock_border_thickness;
    dockIsolateDisplays = cfg.dock_isolate_displays;
    dockLauncherEnabled = cfg.dock_launcher_enabled;
    dockLauncherLogoMode = cfg.dock_launcher_logo_mode;
    dockLauncherLogoCustomPath = cfg.dock_launcher_logo_custom_path;
    dockLauncherLogoColorOverride = cfg.dock_launcher_logo_color_override;
    dockLauncherLogoSizeOffset = cfg.dock_launcher_logo_size_offset;
    dockLauncherLogoBrightness = cfg.dock_launcher_logo_brightness;
    dockLauncherLogoContrast = cfg.dock_launcher_logo_contrast;
    dockMaxVisibleApps = cfg.dock_max_visible_apps;
    dockMaxVisibleRunningApps = cfg.dock_max_visible_running_apps;
    dockShowOverflowBadge = cfg.dock_show_overflow_badge;

    appLauncherViewMode = cfg.app_launcher_view_mode;
    spotlightModalViewMode = cfg.spotlight_modal_view_mode;
    browserPickerViewMode = cfg.browser_picker_view_mode;
    browserUsageHistory = cfg.browser_usage_history;
    appPickerViewMode = cfg.app_picker_view_mode;
    filePickerUsageHistory = cfg.file_picker_usage_history;
    sortAppsAlphabetically = cfg.sort_apps_alphabetically;
    appLauncherGridColumns = cfg.app_launcher_grid_columns;
    spotlightCloseNiriOverview = cfg.spotlight_close_niri_overview;
    rememberLastQuery = cfg.remember_last_query;
    spotlightSectionViewModes = cfg.spotlight_section_view_modes;
    appDrawerSectionViewModes = cfg.app_drawer_section_view_modes;
    niriOverviewOverlayEnabled = cfg.niri_overview_overlay_enabled;
    dankLauncherV2Size = cfg.dank_launcher_v2_size;
    dankLauncherV2BorderEnabled = cfg.dank_launcher_v2_border_enabled;
    dankLauncherV2BorderThickness = cfg.dank_launcher_v2_border_thickness;
    dankLauncherV2BorderColor = cfg.dank_launcher_v2_border_color;
    dankLauncherV2ShowFooter = cfg.dank_launcher_v2_show_footer;
    dankLauncherV2UnloadOnClose = cfg.dank_launcher_v2_unload_on_close;
    dankLauncherV2IncludeFilesInAll = cfg.dank_launcher_v2_include_files_in_all;
    dankLauncherV2IncludeFoldersInAll = cfg.dank_launcher_v2_include_folders_in_all;
    launcherLogoMode = cfg.launcher_logo_mode;
    launcherLogoCustomPath = cfg.launcher_logo_custom_path;
    launcherLogoColorOverride = cfg.launcher_logo_color_override;
    launcherLogoColorInvertOnMode = cfg.launcher_logo_color_invert_on_mode;
    launcherLogoBrightness = cfg.launcher_logo_brightness;
    launcherLogoContrast = cfg.launcher_logo_contrast;
    launcherLogoSizeOffset = cfg.launcher_logo_size_offset;

    greeterRememberLastSession = cfg.greeter_remember_last_session;
    greeterRememberLastUser = cfg.greeter_remember_last_user;
    greeterEnableFprint = cfg.greeter_enable_fprint;
    greeterEnableU2f = cfg.greeter_enable_u2f;
    greeterWallpaperPath = cfg.greeter_wallpaper_path;
    greeterUse24HourClock = cfg.greeter_use24_hour_clock;
    greeterShowSeconds = cfg.greeter_show_seconds;
    greeterPadHours12Hour = cfg.greeter_pad_hours12_hour;
    greeterLockDateFormat = cfg.greeter_lock_date_format;
    greeterFontFamily = cfg.greeter_font_family;
    greeterWallpaperFillMode = cfg.greeter_wallpaper_fill_mode;

    cursorSettings = cfg.cursor_settings;

    notepadUseMonospace = cfg.notepad_use_monospace;
    notepadFontFamily = cfg.notepad_font_family;
    notepadFontSize = cfg.notepad_font_size;
    notepadShowLineNumbers = cfg.notepad_show_line_numbers;
    notepadTransparencyOverride = cfg.notepad_transparency_override;
    notepadLastCustomTransparency = cfg.notepad_last_custom_transparency;

    muxType = cfg.mux_type;
    muxUseCustomCommand = cfg.mux_use_custom_command;
    muxCustomCommand = cfg.mux_custom_command;
    muxSessionFilter = cfg.mux_session_filter;

    launchPrefix = cfg.launch_prefix;

    updaterHideWidget = cfg.updater_hide_widget;
    updaterUseCustomCommand = cfg.updater_use_custom_command;
    updaterCustomCommand = cfg.updater_custom_command;
    updaterTerminalAdditionalParams = cfg.updater_terminal_additional_params;

    displayNameMode = cfg.display_name_mode;
    screenPreferences = cfg.screen_preferences;
    showOnLastDisplay = cfg.show_on_last_display;
    niriOutputSettings = cfg.niri_output_settings;
    hyprlandOutputSettings = cfg.hyprland_output_settings;
    displayProfiles = cfg.display_profiles;
    activeDisplayProfile = cfg.active_display_profile;
    displayProfileAutoSelect = cfg.display_profile_auto_select;
    displayShowDisconnected = cfg.display_show_disconnected;
    displaySnapToEdge = cfg.display_snap_to_edge;

    desktopClockEnabled = cfg.desktop_clock_enabled;
    desktopClockStyle = cfg.desktop_clock_style;
    desktopClockTransparency = cfg.desktop_clock_transparency;
    desktopClockColorMode = cfg.desktop_clock_color_mode;
    desktopClockCustomColor = cfg.desktop_clock_custom_color;
    desktopClockShowDate = cfg.desktop_clock_show_date;
    desktopClockShowAnalogNumbers = cfg.desktop_clock_show_analog_numbers;
    desktopClockShowAnalogSeconds = cfg.desktop_clock_show_analog_seconds;
    desktopClockX = cfg.desktop_clock_x;
    desktopClockY = cfg.desktop_clock_y;
    desktopClockWidth = cfg.desktop_clock_width;
    desktopClockHeight = cfg.desktop_clock_height;
    desktopClockDisplayPreferences = cfg.desktop_clock_display_preferences;

    systemMonitorEnabled = cfg.system_monitor_enabled;
    systemMonitorShowHeader = cfg.system_monitor_show_header;
    systemMonitorTransparency = cfg.system_monitor_transparency;
    systemMonitorColorMode = cfg.system_monitor_color_mode;
    systemMonitorCustomColor = cfg.system_monitor_custom_color;
    systemMonitorShowCpu = cfg.system_monitor_show_cpu;
    systemMonitorShowCpuGraph = cfg.system_monitor_show_cpu_graph;
    systemMonitorShowCpuTemp = cfg.system_monitor_show_cpu_temp;
    systemMonitorShowGpuTemp = cfg.system_monitor_show_gpu_temp;
    systemMonitorGpuPciId = cfg.system_monitor_gpu_pci_id;
    systemMonitorShowMemory = cfg.system_monitor_show_memory;
    systemMonitorShowMemoryGraph = cfg.system_monitor_show_memory_graph;
    systemMonitorShowNetwork = cfg.system_monitor_show_network;
    systemMonitorShowNetworkGraph = cfg.system_monitor_show_network_graph;
    systemMonitorShowDisk = cfg.system_monitor_show_disk;
    systemMonitorShowTopProcesses = cfg.system_monitor_show_top_processes;
    systemMonitorTopProcessCount = cfg.system_monitor_top_process_count;
    systemMonitorTopProcessSortBy = cfg.system_monitor_top_process_sort_by;
    systemMonitorGraphInterval = cfg.system_monitor_graph_interval;
    systemMonitorLayoutMode = cfg.system_monitor_layout_mode;
    systemMonitorX = cfg.system_monitor_x;
    systemMonitorY = cfg.system_monitor_y;
    systemMonitorWidth = cfg.system_monitor_width;
    systemMonitorHeight = cfg.system_monitor_height;
    systemMonitorDisplayPreferences = cfg.system_monitor_display_preferences;
    systemMonitorVariants = cfg.system_monitor_variants;

    desktopWidgetPositions = cfg.desktop_widget_positions;
    desktopWidgetGridSettings = cfg.desktop_widget_grid_settings;
    desktopWidgetInstances = cfg.desktop_widget_instances;
    desktopWidgetGroups = cfg.desktop_widget_groups;

    builtInPluginSettings = cfg.built_in_plugin_settings;
    clipboardEnterToPaste = cfg.clipboard_enter_to_paste;
    launcherPluginVisibility = cfg.launcher_plugin_visibility;
    launcherPluginOrder = cfg.launcher_plugin_order;

    brightnessDevicePins = cfg.brightness_device_pins;
    wifiNetworkPins = cfg.wifi_network_pins;
    bluetoothDevicePins = cfg.bluetooth_device_pins;
    audioInputDevicePins = cfg.audio_input_device_pins;
    audioOutputDevicePins = cfg.audio_output_device_pins;
  };
}
