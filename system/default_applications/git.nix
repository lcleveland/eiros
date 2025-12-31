{ config, lib, ... }:
let
  eiros_git = config.eiros.system.default_applications.git;
in
{
  options.eiros.system.default_applications.git = {
    enable = lib.mkOption {
      default = true;
      description = "Enable Git.";
      type = lib.types.bool;
    };
  };

  config.programs.git.enable = eiros_git.enable;
}
