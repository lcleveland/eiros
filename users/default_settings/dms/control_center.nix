# DMS control center header icons, privacy indicators, tile widgets,
# and workspace switcher options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.control_center = {

    # ── Control center header icons ────────────────────────────────────────
    show_network_icon = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the network icon in the control center header.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_network_icon = false;
        }
      '';
    };

    show_bluetooth_icon = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the Bluetooth icon in the control center header.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_bluetooth_icon = false;
        }
      '';
    };

    show_audio_icon = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the audio icon in the control center header.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_audio_icon = false;
        }
      '';
    };

    show_audio_percent = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show audio volume percentage next to the audio icon.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_audio_percent = true;
        }
      '';
    };

    show_vpn_icon = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the VPN icon in the control center header.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_vpn_icon = false;
        }
      '';
    };

    show_brightness_icon = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show the brightness icon in the control center header.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_brightness_icon = true;
        }
      '';
    };

    show_brightness_percent = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show brightness percentage next to the brightness icon.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_brightness_percent = true;
        }
      '';
    };

    show_mic_icon = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show the microphone icon in the control center header.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_mic_icon = true;
        }
      '';
    };

    show_mic_percent = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show microphone volume percentage next to the mic icon.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_mic_percent = true;
        }
      '';
    };

    show_battery_icon = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show the battery icon in the control center header.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_battery_icon = true;
        }
      '';
    };

    show_printer_icon = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show the printer icon in the control center header.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_printer_icon = true;
        }
      '';
    };

    show_screen_sharing_icon = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the screen sharing icon in the control center header.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_screen_sharing_icon = false;
        }
      '';
    };

    tile_color_mode = lib.mkOption {
      default = "primary";
      type = lib.types.str;
      description = "Active tile color mode in the control center.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.tile_color_mode = "secondary";
        }
      '';
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
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.widgets = [
            { id = "volumeSlider"; enabled = true; width = 100; }
          ];
        }
      '';
    };

    # ── Privacy button ─────────────────────────────────────────────────────
    show_privacy_button = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Show the privacy indicator button in the bar.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_privacy_button = false;
        }
      '';
    };

    privacy_show_mic_icon = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show microphone-in-use indicator in the privacy button.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.privacy_show_mic_icon = true;
        }
      '';
    };

    privacy_show_camera_icon = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show camera-in-use indicator in the privacy button.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.privacy_show_camera_icon = true;
        }
      '';
    };

    privacy_show_screen_share_icon = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show screen-sharing indicator in the privacy button.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.privacy_show_screen_share_icon = true;
        }
      '';
    };

    # ── Workspace switcher ─────────────────────────────────────────────────
    show_workspace_index = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show workspace index number on workspace indicators.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_workspace_index = true;
        }
      '';
    };

    show_workspace_name = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show workspace name on workspace indicators.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_workspace_name = true;
        }
      '';
    };

    show_workspace_padding = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Add extra padding around workspace indicators.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_workspace_padding = true;
        }
      '';
    };

    show_workspace_apps = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show app icons inside workspace indicators.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_workspace_apps = true;
        }
      '';
    };

    show_occupied_workspaces_only = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Only show occupied workspaces in the workspace switcher.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.show_occupied_workspaces_only = true;
        }
      '';
    };

    workspace_scrolling = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Scroll through workspaces by scrolling on the workspace switcher.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.workspace_scrolling = true;
        }
      '';
    };

    workspace_drag_reorder = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Allow dragging workspace indicators to reorder workspaces.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.workspace_drag_reorder = false;
        }
      '';
    };

    workspace_follow_focus = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Auto-scroll the workspace switcher to follow the focused workspace.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.workspace_follow_focus = true;
        }
      '';
    };

    workspace_active_app_highlight_enabled = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Highlight the active app icon in workspace indicators.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.workspace_active_app_highlight_enabled = true;
        }
      '';
    };

    group_workspace_apps = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Group duplicate app icons in workspace indicators.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.group_workspace_apps = false;
        }
      '';
    };

    reverse_scrolling = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Reverse scroll direction on the workspace switcher.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.reverse_scrolling = true;
        }
      '';
    };

    dwl_show_all_tags = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show all DWL tags, not just active ones.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.dwl_show_all_tags = true;
        }
      '';
    };

    max_workspace_icons = lib.mkOption {
      default = 3;
      type = lib.types.int;
      description = "Maximum number of app icons shown per workspace indicator.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.max_workspace_icons = 5;
        }
      '';
    };

    workspace_app_icon_size_offset = lib.mkOption {
      default = 0;
      type = lib.types.int;
      description = "Size offset for app icons inside workspace indicators (pixels).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.workspace_app_icon_size_offset = 2;
        }
      '';
    };

    workspace_color_mode = lib.mkOption {
      default = "default";
      type = lib.types.str;
      description = "Color mode for the focused workspace indicator.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.workspace_color_mode = "primary";
        }
      '';
    };

    workspace_occupied_color_mode = lib.mkOption {
      default = "none";
      type = lib.types.str;
      description = "Color mode for occupied (non-focused) workspace indicators.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.workspace_occupied_color_mode = "secondary";
        }
      '';
    };

    workspace_unfocused_color_mode = lib.mkOption {
      default = "default";
      type = lib.types.str;
      description = "Color mode for unfocused workspace indicators.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.workspace_unfocused_color_mode = "surface";
        }
      '';
    };

    workspace_urgent_color_mode = lib.mkOption {
      default = "default";
      type = lib.types.str;
      description = "Color mode for urgent workspace indicators.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.workspace_urgent_color_mode = "error";
        }
      '';
    };

    workspace_focused_border_enabled = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Show a border around the focused workspace indicator.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.workspace_focused_border_enabled = true;
        }
      '';
    };

    workspace_focused_border_color = lib.mkOption {
      default = "primary";
      type = lib.types.str;
      description = "Border color token for the focused workspace indicator.";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.workspace_focused_border_color = "secondary";
        }
      '';
    };

    workspace_focused_border_thickness = lib.mkOption {
      default = 2;
      type = lib.types.int;
      description = "Border thickness for the focused workspace indicator (pixels).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.workspace_focused_border_thickness = 1;
        }
      '';
    };

    workspace_name_icons = lib.mkOption {
      default = { };
      type = lib.types.attrsOf lib.types.str;
      description = "Map of workspace name to icon character (e.g. { \"1\" = \"\"; }).";
      example = lib.literalExpression ''
        {
          eiros.system.user_defaults.dms.control_center.workspace_name_icons = { "1" = ""; "2" = ""; };
        }
      '';
    };

  };
}
