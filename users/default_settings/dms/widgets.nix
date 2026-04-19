# DMS desktop widget options: notepad, desktop clock, system monitor,
# and generic desktop widget instances/groups/positions.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms.widgets = {

    # ── Notepad widget ─────────────────────────────────────────────────────
    notepad = {
      use_monospace = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Use a monospace font in the notepad widget.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.notepad.use_monospace = false;
          }
        '';
      };

      font_family = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Font family for the notepad widget. Empty = monoFontFamily.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.notepad.font_family = "JetBrains Mono";
          }
        '';
      };

      font_size = lib.mkOption {
        default = 14.0;
        type = lib.types.float;
        description = "Font size for the notepad widget (points).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.notepad.font_size = 12.0;
          }
        '';
      };

      show_line_numbers = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show line numbers in the notepad widget.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.notepad.show_line_numbers = true;
          }
        '';
      };

      transparency_override = lib.mkOption {
        default = (-1.0);
        type = lib.types.float;
        description = "Notepad transparency override (0.0–1.0). -1 = use popupTransparency.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.notepad.transparency_override = 0.9;
          }
        '';
      };

      last_custom_transparency = lib.mkOption {
        default = 0.7;
        type = lib.types.float;
        description = "Last manually set notepad transparency (restored on next custom override).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.notepad.last_custom_transparency = 0.5;
          }
        '';
      };
    };

    # ── Desktop Clock widget ───────────────────────────────────────────────
    desktop_clock = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show a floating clock widget on the desktop wallpaper layer.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop_clock.enable = true;
          }
        '';
      };

      style = lib.mkOption {
        default = "analog";
        type = lib.types.str;
        description = "Desktop clock style. Options: analog, digital.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop_clock.style = "digital";
          }
        '';
      };

      transparency = lib.mkOption {
        default = 0.8;
        type = lib.types.float;
        description = "Desktop clock transparency (0.0–1.0).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop_clock.transparency = 0.6;
          }
        '';
      };

      color_mode = lib.mkOption {
        default = "primary";
        type = lib.types.str;
        description = "Desktop clock color mode.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop_clock.color_mode = "secondary";
          }
        '';
      };

      custom_color = lib.mkOption {
        default = "#ffffff";
        type = lib.types.str;
        description = "Custom desktop clock color (hex).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop_clock.custom_color = "#cdd6f4";
          }
        '';
      };

      show_date = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show the date on the desktop clock.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop_clock.show_date = false;
          }
        '';
      };

      show_analog_numbers = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show hour numerals on the analog desktop clock face.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop_clock.show_analog_numbers = true;
          }
        '';
      };

      show_analog_seconds = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show the seconds hand on the analog desktop clock.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop_clock.show_analog_seconds = false;
          }
        '';
      };

      x = lib.mkOption {
        default = (-1.0);
        type = lib.types.float;
        description = "Desktop clock X position (pixels). -1 = centered.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop_clock.x = 100.0;
          }
        '';
      };

      y = lib.mkOption {
        default = (-1.0);
        type = lib.types.float;
        description = "Desktop clock Y position (pixels). -1 = centered.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop_clock.y = 100.0;
          }
        '';
      };

      width = lib.mkOption {
        default = 280.0;
        type = lib.types.float;
        description = "Desktop clock width (pixels).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop_clock.width = 320.0;
          }
        '';
      };

      height = lib.mkOption {
        default = 180.0;
        type = lib.types.float;
        description = "Desktop clock height (pixels).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop_clock.height = 200.0;
          }
        '';
      };

      display_preferences = lib.mkOption {
        default = [ "all" ];
        type = lib.types.listOf lib.types.str;
        description = "Monitors to show the desktop clock on.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop_clock.display_preferences = [ "eDP-1" ];
          }
        '';
      };
    };

    # ── System Monitor widget ──────────────────────────────────────────────
    system_monitor = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show the floating system monitor widget on the desktop.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.enable = true;
          }
        '';
      };

      show_header = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show the header row in the system monitor widget.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.show_header = false;
          }
        '';
      };

      transparency = lib.mkOption {
        default = 0.8;
        type = lib.types.float;
        description = "System monitor widget transparency (0.0–1.0).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.transparency = 0.6;
          }
        '';
      };

      color_mode = lib.mkOption {
        default = "primary";
        type = lib.types.str;
        description = "System monitor color mode.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.color_mode = "secondary";
          }
        '';
      };

      custom_color = lib.mkOption {
        default = "#ffffff";
        type = lib.types.str;
        description = "Custom system monitor color (hex).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.custom_color = "#cdd6f4";
          }
        '';
      };

      show_cpu = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show CPU usage in the system monitor.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.show_cpu = false;
          }
        '';
      };

      show_cpu_graph = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show CPU usage history graph in the system monitor.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.show_cpu_graph = false;
          }
        '';
      };

      show_cpu_temp = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show CPU temperature in the system monitor.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.show_cpu_temp = false;
          }
        '';
      };

      show_gpu_temp = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show GPU temperature in the system monitor.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.show_gpu_temp = true;
          }
        '';
      };

      gpu_pci_id = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "PCI ID of the GPU to monitor. Empty = first available GPU.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.gpu_pci_id = "10de:2204";
          }
        '';
      };

      show_memory = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show memory usage in the system monitor.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.show_memory = false;
          }
        '';
      };

      show_memory_graph = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show memory usage history graph in the system monitor.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.show_memory_graph = false;
          }
        '';
      };

      show_network = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show network throughput in the system monitor.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.show_network = false;
          }
        '';
      };

      show_network_graph = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show network throughput history graph in the system monitor.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.show_network_graph = false;
          }
        '';
      };

      show_disk = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show disk usage in the system monitor.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.show_disk = false;
          }
        '';
      };

      show_top_processes = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show top processes by resource usage in the system monitor.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.show_top_processes = true;
          }
        '';
      };

      top_process_count = lib.mkOption {
        default = 3;
        type = lib.types.int;
        description = "Number of top processes to display.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.top_process_count = 5;
          }
        '';
      };

      top_process_sort_by = lib.mkOption {
        default = "cpu";
        type = lib.types.str;
        description = "Sort top processes by. Options: cpu, memory.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.top_process_sort_by = "memory";
          }
        '';
      };

      graph_interval = lib.mkOption {
        default = 60;
        type = lib.types.int;
        description = "History duration shown in system monitor graphs (seconds).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.graph_interval = 120;
          }
        '';
      };

      layout_mode = lib.mkOption {
        default = "auto";
        type = lib.types.str;
        description = "System monitor layout mode. Options: auto, vertical, horizontal.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.layout_mode = "vertical";
          }
        '';
      };

      x = lib.mkOption {
        default = (-1.0);
        type = lib.types.float;
        description = "System monitor X position (pixels). -1 = centered.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.x = 50.0;
          }
        '';
      };

      y = lib.mkOption {
        default = (-1.0);
        type = lib.types.float;
        description = "System monitor Y position (pixels). -1 = centered.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.y = 50.0;
          }
        '';
      };

      width = lib.mkOption {
        default = 320.0;
        type = lib.types.float;
        description = "System monitor width (pixels).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.width = 400.0;
          }
        '';
      };

      height = lib.mkOption {
        default = 480.0;
        type = lib.types.float;
        description = "System monitor height (pixels).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.height = 600.0;
          }
        '';
      };

      display_preferences = lib.mkOption {
        default = [ "all" ];
        type = lib.types.listOf lib.types.str;
        description = "Monitors to show the system monitor widget on.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.display_preferences = [ "eDP-1" ];
          }
        '';
      };

      variants = lib.mkOption {
        default = [ ];
        type = lib.types.listOf lib.types.anything;
        description = "Additional system monitor widget instances with independent configurations.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.system_monitor.variants = [
              { x = 100.0; y = 100.0; show_cpu = true; show_memory = false; }
            ];
          }
        '';
      };
    };

    # ── Desktop plugin widgets ─────────────────────────────────────────────
    desktop = {
      widget_positions = lib.mkOption {
        default = { };
        type = lib.types.attrsOf lib.types.anything;
        description = "Saved positions for desktop plugin widgets per screen.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop.widget_positions = {
              "eDP-1" = { "my-widget" = { x = 100; y = 200; }; };
            };
          }
        '';
      };

      widget_grid_settings = lib.mkOption {
        default = { };
        type = lib.types.attrsOf lib.types.anything;
        description = "Grid layout settings for desktop widgets per screen.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop.widget_grid_settings = {
              "eDP-1" = { columns = 12; rows = 8; };
            };
          }
        '';
      };

      widget_instances = lib.mkOption {
        default = [ ];
        type = lib.types.listOf lib.types.anything;
        description = "Desktop widget plugin instances (type, name, config, position).";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop.widget_instances = [
              { type = "clock"; name = "My Clock"; config = { style = "digital"; }; }
            ];
          }
        '';
      };

      widget_groups = lib.mkOption {
        default = [ ];
        type = lib.types.listOf lib.types.anything;
        description = "Desktop widget group definitions for grouping multiple instances.";
        example = lib.literalExpression ''
          {
            eiros.system.user_defaults.dms.widgets.desktop.widget_groups = [
              { name = "Info Panel"; widgets = [ "clock" "sysmon" ]; }
            ];
          }
        '';
      };
    };

  };
}
