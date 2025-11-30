{
  description = "Eiros: A NixOS configuration using MangoWC";
  outputs =
    {
      mango,
      nixpkgs,
      self,
      ...
    }@system_inputs:
    let
      import_modules = import ./resources/nix/import_modules.nix;
      inputs = system_inputs;
      base_modules = [
        inputs.mango.nixosModules.mango
        /etc/nixos/hardware-configuration.nix
      ]
      ++ (import_modules ./system);
      make_vm = nixpkgs.lib.nixosSystem {
        modules = base_modules;
        specialArgs = { inherit inputs; };
      };
    in
    {
      nixosConfigurations = {
        vm = make_vm;
      };
    };
  inputs = {
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=25.11-beta";
    };
  };
}
