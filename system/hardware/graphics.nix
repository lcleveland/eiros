{
  config,
  lib,
  pkgs,
  ...
}:
let
  eiros_graphics = config.eiros.system.hardware.graphics;
  eiros_nvidia = eiros_graphics.nvidia;
in
{
  options.eiros.system.hardware.graphics = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Eiros hardware graphics.";
    };

    nvidia = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Nvidia GPU support.";
      };

      cuda = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable CUDA support (toolkit + nixpkgs cudaSupport).";
        };

        add_cache = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Add nixos-cuda binary cache via extra-substituters.";
        };
      };
    };
  };

  config = lib.mkIf eiros_graphics.enable {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = lib.mkIf eiros_nvidia.enable [ "nvidia" ];
    hardware.nvidia = lib.mkIf eiros_nvidia.enable {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
    };
    nixpkgs.config.cudaSupport = lib.mkIf (eiros_nvidia.enable && eiros_nvidia.cuda.enable) true;
    environment.systemPackages = lib.mkIf (eiros_nvidia.enable && eiros_nvidia.cuda.enable) (
      with pkgs;
      [
        cudaPackages.cudatoolkit
        nvtopPackages.nvidia
      ]
    );
    hardware.opengl.extraPackages = lib.mkIf eiros_nvidia.enable [
      pkgs.nvidia-vaapi-driver
    ];
    environment.variables = lib.mkIf eiros_nvidia.enable {
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    nix.settings =
      lib.mkIf (eiros_nvidia.enable && eiros_nvidia.cuda.enable && eiros_nvidia.cuda.add_cache)
        {
          extra-substituters = [ "https://cache.nixos-cuda.org" ];
          extra-trusted-public-keys = [
            "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
          ];
        };
  };
}
