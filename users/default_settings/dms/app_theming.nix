# DMS application theming (GTK, Qt, portals, icon theme) and per-app
# matugen template toggle options.
{ lib, ... }:
{
  options.eiros.system.user_defaults.dms = {

    # ── Application theming ────────────────────────────────────────────────
    gtk_theming_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Apply the active DMS color scheme to GTK 3/4 applications via matugen.";
    };

    qt_theming_enabled = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Apply the active DMS color scheme to Qt applications via qt5ct/qt6ct.";
    };

    sync_mode_with_portal = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Sync dark/light mode with the XDG desktop portal (benefits Flatpak apps).";
    };

    terminals_always_dark = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Always use the dark color variant for terminal applications even in light mode.";
    };

    icon_theme = lib.mkOption {
      default = "System Default";
      type = lib.types.str;
      description = "Icon theme name. \"System Default\" defers to the platform theme (QT_QPA_PLATFORMTHEME).";
    };

    network_preference = lib.mkOption {
      default = "auto";
      type = lib.types.str;
      description = "Preferred network display type. Options: auto, wifi, ethernet.";
    };

    # ── Matugen template toggles ───────────────────────────────────────────
    run_dms_matugen_templates = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Run all DMS-provided matugen templates on theme or wallpaper change.";
    };

    matugen_template_gtk = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate GTK theme colors via matugen.";
    };

    matugen_template_niri = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate Niri compositor color config via matugen.";
    };

    matugen_template_hyprland = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate Hyprland compositor color config via matugen.";
    };

    matugen_template_mangowc = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate MangoWC compositor color config via matugen.";
    };

    matugen_template_qt5ct = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate qt5ct color palette via matugen.";
    };

    matugen_template_qt6ct = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate qt6ct color palette via matugen.";
    };

    matugen_template_firefox = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate Firefox theme colors via matugen (requires MaterialFox or compatible theme).";
    };

    matugen_template_pywalfox = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate Pywalfox Firefox theme colors via matugen.";
    };

    matugen_template_zen_browser = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate Zen Browser theme colors via matugen.";
    };

    matugen_template_vesktop = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate Vesktop (Discord) theme colors via matugen.";
    };

    matugen_template_equibop = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate Equibop (Discord) theme colors via matugen.";
    };

    matugen_template_ghostty = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate Ghostty terminal colors via matugen.";
    };

    matugen_template_kitty = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate Kitty terminal colors via matugen.";
    };

    matugen_template_foot = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate Foot terminal colors via matugen.";
    };

    matugen_template_alacritty = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate Alacritty terminal colors via matugen.";
    };

    matugen_template_neovim = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Generate Neovim color scheme via matugen.";
    };

    matugen_template_wezterm = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate WezTerm terminal colors via matugen.";
    };

    matugen_template_dgop = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate dgop (GTK color override proxy) colors via matugen.";
    };

    matugen_template_kcolorscheme = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate KDE color scheme via matugen.";
    };

    matugen_template_vscode = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate VS Code / VSCodium theme via matugen.";
    };

    matugen_template_emacs = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate Emacs theme via matugen.";
    };

    matugen_template_zed = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Generate Zed editor theme via matugen.";
    };

    matugen_template_neovim_settings = lib.mkOption {
      default = {
        dark = {
          baseTheme = "github_dark";
          harmony = 0.5;
        };
        light = {
          baseTheme = "github_light";
          harmony = 0.5;
        };
      };
      type = lib.types.anything;
      description = "Neovim matugen template settings for dark and light mode variants.";
    };

    matugen_template_neovim_set_background = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Set Neovim 'background' option (dark/light) via the matugen template.";
    };

  };
}
