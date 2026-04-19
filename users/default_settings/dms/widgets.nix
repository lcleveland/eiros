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
      };

      font_family = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "Font family for the notepad widget. Empty = monoFontFamily.";
      };

      font_size = lib.mkOption {
        default = 14.0;
        type = lib.types.float;
        description = "Font size for the notepad widget (points).";
      };

      show_line_numbers = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show line numbers in the notepad widget.";
      };

      transparency_override = lib.mkOption {
        default = (-1.0);
        type = lib.types.float;
        description = "Notepad transparency override (0.0–1.0). -1 = use popupTransparency.";
      };

      last_custom_transparency = lib.mkOption {
        default = 0.7;
        type = lib.types.float;
        description = "Last manually set notepad transparency (restored on next custom override).";
      };
    };

    # ── Desktop Clock widget ───────────────────────────────────────────────
    desktop_clock = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show a floating clock widget on the desktop wallpaper layer.";
      };

      style = lib.mkOption {
        default = "analog";
        type = lib.types.str;
        description = "Desktop clock style. Options: analog, digital.";
      };

      transparency = lib.mkOption {
        default = 0.8;
        type = lib.types.float;
        description = "Desktop clock transparency (0.0–1.0).";
      };

      color_mode = lib.mkOption {
        default = "primary";
        type = lib.types.str;
        description = "Desktop clock color mode.";
      };

      custom_color = lib.mkOption {
        default = "#ffffff";
        type = lib.types.str;
        description = "Custom desktop clock color (hex).";
      };

      show_date = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show the date on the desktop clock.";
      };

      show_analog_numbers = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show hour numerals on the analog desktop clock face.";
      };

      show_analog_seconds = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show the seconds hand on the analog desktop clock.";
      };

      x = lib.mkOption {
        default = (-1.0);
        type = lib.types.float;
        description = "Desktop clock X position (pixels). -1 = centered.";
      };

      y = lib.mkOption {
        default = (-1.0);
        type = lib.types.float;
        description = "Desktop clock Y position (pixels). -1 = centered.";
      };

      width = lib.mkOption {
        default = 280.0;
        type = lib.types.float;
        description = "Desktop clock width (pixels).";
      };

      height = lib.mkOption {
        default = 180.0;
        type = lib.types.float;
        description = "Desktop clock height (pixels).";
      };

      display_preferences = lib.mkOption {
        default = [ "all" ];
        type = lib.types.listOf lib.types.str;
        description = "Monitors to show the desktop clock on.";
      };
    };

    # ── System Monitor widget ──────────────────────────────────────────────
    system_monitor = {
      enable = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show the floating system monitor widget on the desktop.";
      };

      show_header = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show the header row in the system monitor widget.";
      };

      transparency = lib.mkOption {
        default = 0.8;
        type = lib.types.float;
        description = "System monitor widget transparency (0.0–1.0).";
      };

      color_mode = lib.mkOption {
        default = "primary";
        type = lib.types.str;
        description = "System monitor color mode.";
      };

      custom_color = lib.mkOption {
        default = "#ffffff";
        type = lib.types.str;
        description = "Custom system monitor color (hex).";
      };

      show_cpu = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show CPU usage in the system monitor.";
      };

      show_cpu_graph = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show CPU usage history graph in the system monitor.";
      };

      show_cpu_temp = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show CPU temperature in the system monitor.";
      };

      show_gpu_temp = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show GPU temperature in the system monitor.";
      };

      gpu_pci_id = lib.mkOption {
        default = "";
        type = lib.types.str;
        description = "PCI ID of the GPU to monitor. Empty = first available GPU.";
      };

      show_memory = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show memory usage in the system monitor.";
      };

      show_memory_graph = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show memory usage history graph in the system monitor.";
      };

      show_network = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show network throughput in the system monitor.";
      };

      show_network_graph = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show network throughput history graph in the system monitor.";
      };

      show_disk = lib.mkOption {
        default = true;
        type = lib.types.bool;
        description = "Show disk usage in the system monitor.";
      };

      show_top_processes = lib.mkOption {
        default = false;
        type = lib.types.bool;
        description = "Show top processes by resource usage in the system monitor.";
      };

      top_process_count = lib.mkOption {
        default = 3;
        type = lib.types.int;
        description = "Number of top processes to display.";
      };

      top_process_sort_by = lib.mkOption {
        default = "cpu";
        type = lib.types.str;
        description = "Sort top processes by. Options: cpu, memory.";
      };

      graph_interval = lib.mkOption {
        default = 60;
        type = lib.types.int;
        description = "History duration shown in system monitor graphs (seconds).";
      };

      layout_mode = lib.mkOption {
        default = "auto";
        type = lib.types.str;
        description = "System monitor layout mode. Options: auto, vertical, horizontal.";
      };

      x = lib.mkOption {
        default = (-1.0);
        type = lib.types.float;
        description = "System monitor X position (pixels). -1 = centered.";
      };

      y = lib.mkOption {
        default = (-1.0);
        type = lib.types.float;
        description = "System monitor Y position (pixels). -1 = centered.";
      };

      width = lib.mkOption {
        default = 320.0;
        type = lib.types.float;
        description = "System monitor width (pixels).";
      };

      height = lib.mkOption {
        default = 480.0;
        type = lib.types.float;
        description = "System monitor height (pixels).";
      };

      display_preferences = lib.mkOption {
        default = [ "all" ];
        type = lib.types.listOf lib.types.str;
        description = "Monitors to show the system monitor widget on.";
      };

      variants = lib.mkOption {
        default = [ ];
        type = lib.types.listOf lib.types.anything;
        description = "Additional system monitor widget instances with independent configurations.";
      };
    };

    # ── Desktop plugin widgets ─────────────────────────────────────────────
    desktop = {
      widget_positions = lib.mkOption {
        default = { };
        type = lib.types.attrsOf lib.types.anything;
        description = "Saved positions for desktop plugin widgets per screen.";
      };

      widget_grid_settings = lib.mkOption {
        default = { };
        type = lib.types.attrsOf lib.types.anything;
        description = "Grid layout settings for desktop widgets per screen.";
      };

      widget_instances = lib.mkOption {
        default = [ ];
        type = lib.types.listOf lib.types.anything;
        description = "Desktop widget plugin instances (type, name, config, position).";
      };

      widget_groups = lib.mkOption {
        default = [ ];
        type = lib.types.listOf lib.types.anything;
        description = "Desktop widget group definitions for grouping multiple instances.";
      };
    };

  };
}
