{
  description = "Eiros: A NixOS configuration using MangoWC";
  outputs =
    {
      hjem,
      mango,
      nixpkgs,
      self,
      ...
    }@system_inputs:
    let
      import_modules = import ./resources/nix/import_modules.nix;
      inputs = system_inputs;
      base_modules = [
        inputs.hjem.nixosModules.default
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
    hjem = {
      url = "github:feel-co/hjem";
    };
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=25.11-beta";
    };
  };
}
