# flake.nix
{
  description = "Eiros minimal test";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./users/default_user_list.nix
          ./users/eiros.nix
          ./users/set_user_defaults.nix
          ({ ... }: { }) # empty host
        ];
      };
    };
}
