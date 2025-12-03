{
  config,
  lib,
  pkgs,
  ...
}:

let
  # All Eiros-managed users (data, from schema in eiros.nix)
  eirosUsers = config.eiros.users;
in
{
  ###########################
  ## Expand eiros.users.* into users.users.* + hjem.users.*
  ###########################

  config = lib.mkMerge (
    lib.mapAttrsToList (
      name: ucfg:
      lib.mkIf ucfg.enable (
        let
          homeDir = if ucfg.home != null then ucfg.home else "/home/${name}";

          initialPw = if ucfg.initialPassword != null then ucfg.initialPassword else name;

          shellPkg = if ucfg.shell != null then ucfg.shell else pkgs.bashInteractive; # or pkgs.zsh if you prefer
        in
        {
          users.users.${name} = {
            isNormalUser = true;
            description = ucfg.description;
            home = homeDir;
            initialPassword = initialPw;
            extraGroups = ucfg.extraGroups;
            shell = shellPkg;
          };

          hjem.users.${name} = {
            user = name;
            directory = homeDir;
          };
        }
      )
    ) eirosUsers
  );
}
