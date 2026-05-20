# Dock-friendly udev tweaks. Keeps USB hubs from being suspended out from under
# the OS — a recurring cause of hard freezes when unplugging a USB-C dock.
{
  config,
  lib,
  ...
}:
let
  eiros_docking = config.eiros.system.hardware.docking;
in
{
  options.eiros.system.hardware.docking = {
    enable = lib.mkOption {
      default = true;
      description = "Apply dock-friendly udev/power tweaks.";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.docking.enable = false;
        }
      '';
      type = lib.types.bool;
    };

    keep_usb_hubs_awake = lib.mkOption {
      default = true;
      description = "Disable USB autosuspend on USB hubs (class 09). A USB-C dock presents itself as a hub; letting the kernel power-gate it can cause hard freezes on undock.";
      example = lib.literalExpression ''
        {
          eiros.system.hardware.docking.keep_usb_hubs_awake = false;
        }
      '';
      type = lib.types.bool;
    };
  };

  config = lib.mkIf eiros_docking.enable {
    services.udev.extraRules = lib.mkIf eiros_docking.keep_usb_hubs_awake ''
      ACTION=="add", SUBSYSTEM=="usb", ATTR{bDeviceClass}=="09", TEST=="power/control", ATTR{power/control}="on"
    '';

    # Per-host knobs if a specific machine still freezes on undock. Not applied
    # here — set in the host config instead.
    #
    #   Intel:   boot.kernelParams = [ "i915.enable_dc=0" "intel_idle.max_cstate=1" ];
    #   NVIDIA:  boot.kernelParams = [ "nvidia-drm.modeset=1" ];
    #   AMD:     ensure boot.kernelPackages is recent (>=6.12.11) so the DMUB
    #            regression fix is in. hardware.enableAllFirmware should already
    #            be true.
    #
    # Manual display recovery if the layout misfires after a dock cycle (bind
    # to a keybind if useful):
    #   dms ipc call outputs refresh           # re-apply current DMS output profile
    #   dms ipc call outputs setProfile <name> # force a named DMS profile
    #   mmsg -d reload_config                  # full MangoWC config reload
  };
}
