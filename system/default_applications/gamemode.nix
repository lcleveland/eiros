{ config, lib, ... }:
let
  eiros_gamemode = config.eiros.system.default_applications.gamemode;
in
{
  options.eiros.system.default_applications.gamemode.enable = lib.mkOption {
    default = true;
    description = "Enable GameMode for on-demand CPU performance profiles. Any latency-sensitive application can request a performance boost via the GameMode D-Bus API.";
    type = lib.types.bool;
  };

  config = lib.mkIf eiros_gamemode.enable {
    programs.gamemode.enable = true;
  };
}
