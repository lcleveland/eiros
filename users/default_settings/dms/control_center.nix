# DMS control center header icons, privacy indicators, tile widgets,
# and workspace switcher options.
{ lib, ... }:
let
  mkBoolOption = default: desc: lib.mkOption {
    inherit default;
    type = lib.types.bool;
    description = desc;
  };
in
{
  options.eiros.system.user_defaults.dms.control_center = {

    # ── Control center header icons ────────────────────────────────────────
    show_network_icon = mkBoolOption true "Show the network icon in the control center header.";
    show_bluetooth_icon = mkBoolOption true "Show the Bluetooth icon in the control center header.";
    show_audio_icon = mkBoolOption true "Show the audio icon in the control center header.";
    show_audio_percent = mkBoolOption false "Show audio volume percentage next to the audio icon.";
    show_vpn_icon = mkBoolOption true "Show the VPN icon in the control center header.";
    show_brightness_icon = mkBoolOption false "Show the brightness icon in the control center header.";
    show_brightness_percent = mkBoolOption false "Show brightness percentage next to the brightness icon.";
    show_mic_icon = mkBoolOption false "Show the microphone icon in the control center header.";
    show_mic_percent = mkBoolOption false "Show microphone volume percentage next to the mic icon.";
    show_battery_icon = mkBoolOption false "Show the battery icon in the control center header.";
    show_printer_icon = mkBoolOption false "Show the printer icon in the control center header.";
    show_screen_sharing_icon = mkBoolOption true "Show the screen sharing icon in the control center header.";

    tile_color_mode = lib.mkOption {
      default = "primary";
      type = lib.types.str;
      description = "Active tile color mode in the control center.";
    };

    widgets = lib.mkOption {
      default = [
        { id = "volumeSlider"; enabled = true; width = 50; }
        { id = "brightnessSlider"; enabled = true; width = 50; }
        { id = "wifi"; enabled = true; width = 50; }
        { id = "bluetooth"; enabled = true; width = 50; }
        { id = "audioOutput"; enabled = true; width = 50; }
        { id = "audioInput"; enabled = true; width = 50; }
        { id = "nightMode"; enabled = true; width = 50; }
        { id = "darkMode"; enabled = true; width = 50; }
      ];
      type = lib.types.listOf lib.types.anything;
      description = "Ordered list of control center tile widgets with enabled/width configuration.";
    };

    # ── Privacy button ─────────────────────────────────────────────────────
    show_privacy_button = mkBoolOption true "Show the privacy indicator button in the bar.";
    privacy_show_mic_icon = mkBoolOption false "Show microphone-in-use indicator in the privacy button.";
    privacy_show_camera_icon = mkBoolOption false "Show camera-in-use indicator in the privacy button.";
    privacy_show_screen_share_icon = mkBoolOption false "Show screen-sharing indicator in the privacy button.";

    # ── Workspace switcher ─────────────────────────────────────────────────
    show_workspace_index = mkBoolOption false "Show workspace index number on workspace indicators.";
    show_workspace_name = mkBoolOption false "Show workspace name on workspace indicators.";
    show_workspace_padding = mkBoolOption false "Add extra padding around workspace indicators.";
    show_workspace_apps = mkBoolOption false "Show app icons inside workspace indicators.";
    show_occupied_workspaces_only = mkBoolOption false "Only show occupied workspaces in the workspace switcher.";

    workspace_scrolling = mkBoolOption false "Scroll through workspaces by scrolling on the workspace switcher.";
    workspace_drag_reorder = mkBoolOption true "Allow dragging workspace indicators to reorder workspaces.";
    workspace_follow_focus = mkBoolOption false "Auto-scroll the workspace switcher to follow the focused workspace.";
    workspace_active_app_highlight_enabled = mkBoolOption false "Highlight the active app icon in workspace indicators.";

    group_workspace_apps = mkBoolOption true "Group duplicate app icons in workspace indicators.";
    reverse_scrolling = mkBoolOption false "Reverse scroll direction on the workspace switcher.";
    dwl_show_all_tags = mkBoolOption false "Show all DWL tags, not just active ones.";

    max_workspace_icons = lib.mkOption {
      default = 3;
      type = lib.types.int;
      description = "Maximum number of app icons shown per workspace indicator.";
    };

    workspace_app_icon_size_offset = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Size offset for app icons inside workspace indicators (pixels).";
    };

    workspace_color_mode = lib.mkOption {
      default = "default";
      type = lib.types.str;
      description = "Color mode for the focused workspace indicator.";
    };

    workspace_occupied_color_mode = lib.mkOption {
      default = "none";
      type = lib.types.str;
      description = "Color mode for occupied (non-focused) workspace indicators.";
    };

    workspace_unfocused_color_mode = lib.mkOption {
      default = "default";
      type = lib.types.str;
      description = "Color mode for unfocused workspace indicators.";
    };

    workspace_urgent_color_mode = lib.mkOption {
      default = "default";
      type = lib.types.str;
      description = "Color mode for urgent workspace indicators.";
    };

    workspace_focused_border_enabled = mkBoolOption false "Show a border around the focused workspace indicator.";

    workspace_focused_border_color = lib.mkOption {
      default = "primary";
      type = lib.types.str;
      description = "Border color token for the focused workspace indicator.";
    };

    workspace_focused_border_thickness = lib.mkOption {
      default = 2;
      type = lib.types.int;
      description = "Border thickness for the focused workspace indicator (pixels).";
    };

    workspace_name_icons = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.str;
      description = "Map of workspace name to icon character (e.g. { \"1\" = \"\"; }).";
    };

  };
}
