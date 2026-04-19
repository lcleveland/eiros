# DMS application theming (GTK, Qt, portals, icon theme) and per-app
# matugen template toggle options.
{ lib, ... }:
let
  mkMatugenBoolOption = default: desc: lib.mkOption {
    inherit default;
    type = lib.types.bool;
    description = desc;
  };
in
{
  options.eiros.system.user_defaults.dms.app_theming = {

    # ── Application theming ────────────────────────────────────────────────
    gtk.enable = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Apply the active DMS color scheme to GTK 3/4 applications via matugen.";
    };

    qt.enable = lib.mkOption {
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
    matugen = {
      run_dms_templates = mkMatugenBoolOption true "Run all DMS-provided matugen templates on theme or wallpaper change.";

      gtk = mkMatugenBoolOption true "Generate GTK theme colors via matugen.";
      niri = mkMatugenBoolOption true "Generate Niri compositor color config via matugen.";
      hyprland = mkMatugenBoolOption true "Generate Hyprland compositor color config via matugen.";
      mangowc = mkMatugenBoolOption true "Generate MangoWC compositor color config via matugen.";
      qt5ct = mkMatugenBoolOption true "Generate qt5ct color palette via matugen.";
      qt6ct = mkMatugenBoolOption true "Generate qt6ct color palette via matugen.";
      firefox = mkMatugenBoolOption true "Generate Firefox theme colors via matugen (requires MaterialFox or compatible theme).";
      pywalfox = mkMatugenBoolOption true "Generate Pywalfox Firefox theme colors via matugen.";
      zen_browser = mkMatugenBoolOption true "Generate Zen Browser theme colors via matugen.";
      vesktop = mkMatugenBoolOption true "Generate Vesktop (Discord) theme colors via matugen.";
      equibop = mkMatugenBoolOption true "Generate Equibop (Discord) theme colors via matugen.";
      ghostty = mkMatugenBoolOption true "Generate Ghostty terminal colors via matugen.";
      kitty = mkMatugenBoolOption true "Generate Kitty terminal colors via matugen.";
      foot = mkMatugenBoolOption true "Generate Foot terminal colors via matugen.";
      alacritty = mkMatugenBoolOption true "Generate Alacritty terminal colors via matugen.";
      neovim = mkMatugenBoolOption false "Generate Neovim color scheme via matugen.";
      wezterm = mkMatugenBoolOption true "Generate WezTerm terminal colors via matugen.";
      dgop = mkMatugenBoolOption true "Generate dgop (GTK color override proxy) colors via matugen.";
      kcolorscheme = mkMatugenBoolOption true "Generate KDE color scheme via matugen.";
      vscode = mkMatugenBoolOption true "Generate VS Code / VSCodium theme via matugen.";
      emacs = mkMatugenBoolOption true "Generate Emacs theme via matugen.";
      zed = mkMatugenBoolOption true "Generate Zed editor theme via matugen.";

      neovim_settings = lib.mkOption {
        default = {
          dark = { baseTheme = "github_dark"; harmony = 0.5; };
          light = { baseTheme = "github_light"; harmony = 0.5; };
        };
        type = lib.types.anything;
        description = "Neovim matugen template settings for dark and light mode variants.";
      };

      neovim_set_background = mkMatugenBoolOption true "Set Neovim 'background' option (dark/light) via the matugen template.";
    };

  };
}
