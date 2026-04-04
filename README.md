# Eiros

A modular, declarative NixOS system configuration built with Nix flakes. Eiros manages both system-level and user-level settings around the MangoWC Wayland compositor and Dank Material Shell (DMS) desktop environment.

The core repo defines the module schemas and defaults. Personal hardware and user configuration lives in separate flake repos that are injected at build time via `--override-input`.

## Features

- **Modular architecture** — `.nix` files in subdirectories are auto-loaded; no manual imports needed
- **MangoWC integration** — declarative keybinds, settings, and wallpaper per user
- **Dank Material Shell** — audio visualizer, clipboard history, dynamic theming, calendar, system monitoring, and search
- **Home directory management** via [hjem](https://github.com/feel-co/hjem)
- **Hardware support** — NVIDIA PRIME (offload/sync), Intel/AMD CPU microcode, Bluetooth, printing, fingerprint
- **Security-first defaults** — UFW firewall enabled, SSH disabled, no password auth over SSH
- **Virtualization** — KVM/QEMU, Libvirt, Podman, Distrobox, Virt Manager

## Directory Structure

```
eiros/
├── flake.nix               # Flake definition and inputs
├── system/                 # System module schemas and defaults
│   ├── boot/               # Bootloader, kernel, Plymouth
│   ├── hardware/           # CPU, GPU, power, peripherals
│   ├── desktop_environment/# MangoWC, DMS, XDG portals, Wayland
│   ├── default_applications/# Neovim, Git, Zsh, Ghostty, Vivaldi
│   ├── networking/         # NetworkManager, hostname, DNS
│   ├── security/           # Firewall, SSH, GPG, PAM
│   ├── nix/                # Flakes, GC, direnv, nix-ld
│   ├── virtualization/     # KVM, Podman, Distrobox
│   ├── fonts/              # Font packages and fontconfig
│   └── ...                 # Audio, locale, time, logging, accounts
├── users/
│   └── users.nix           # User module schema
└── resources/
    └── nix/
        ├── import_modules.nix      # Recursive module auto-loader
        └── render_hypr_config.nix  # Hyprland config renderer
```

## Usage

### Prerequisites

- NixOS with Nix flakes enabled
- Git
- A hardware config flake (provides `nixosModules.default` for `eiros.system.hardware.*` options)
- A users config flake (provides `nixosModules.default` for `eiros.users.*` options)

### Building

Point Eiros at your own hardware and user config repos using `--override-input`:

```bash
sudo nixos-rebuild boot --flake .#default \
  --override-input eiros_users github:yourname/eiros.users.yourconfig \
  --override-input eiros_hardware github:yourname/eiros.hardware.yourmachine
```

### Creating Your Own Config Repos

**Hardware repo** (`eiros.hardware.*`)

Create a flake that exports `nixosModules.default` and sets `eiros.system.hardware.*` options:

```nix
# flake.nix in your hardware repo
{
  outputs = { nixpkgs, ... }: {
    nixosModules.default = { ... }: {
      eiros.system.hardware.cpu.vendor = "amd";
      eiros.system.hardware.graphics.nvidia.enable = true;
      # ...
    };
  };
}
```

**Users repo** (`eiros.users.*`)

Create a flake that exports `nixosModules.default` and sets `eiros.users.*` options:

```nix
# flake.nix in your users repo
{
  outputs = { nixpkgs, ... }: {
    nixosModules.default = { ... }: {
      eiros.users.yourusername = {
        initial_password = "change_me";
        mangowc = {
          settings = {
            # MangoWC key-value config
          };
          keybinds = {
            open_terminal = {
              modifier_keys = [ "SUPER" ];
              key_symbol = "Return";
              mangowc_command = "spawn";
              command_arguments = "ghostty";
            };
          };
          wallpaper = /path/to/wallpaper.png;
        };
      };
    };
  };
}
```

> **Warning:** The default `initial_password` is the username. Change it before deploying — a build warning will remind you if you forget.

## Available Options

All options are under the `eiros.*` namespace:

| Namespace | Description |
|---|---|
| `eiros.system.hardware.*` | CPU vendor, GPU, power, peripherals |
| `eiros.system.boot.*` | Bootloader, kernel, Plymouth theme |
| `eiros.system.networking.*` | Hostname, DNS, NetworkManager |
| `eiros.system.security.*` | Firewall, SSH, GPG |
| `eiros.system.desktop_environment.*` | MangoWC, DMS, XDG portals |
| `eiros.system.virtualization.*` | KVM, Podman, Distrobox |
| `eiros.users.*` | User accounts, MangoWC keybinds, wallpaper |

## Flake Inputs

| Input | Source | Purpose |
|---|---|---|
| `nixpkgs` | NixOS/nixpkgs | Package set (tracks master) |
| `dank_material_shell` | AvengeMedia | DMS desktop shell and greeter modules |
| `hjem` | feel-co | Home directory management |
| `mango` | DreamMaoMao | MangoWC compositor module |
| `eiros_hardware` | lcleveland/eiros.hardware | Hardware configuration (override with your own) |
| `eiros_users` | lcleveland/eiros.users | User configuration (override with your own) |
