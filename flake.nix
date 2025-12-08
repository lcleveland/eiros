{
  description = "Eiros: A NixOS configuration using MangoWC";
  outputs =
    {
      dank_material_shell,
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
        inputs.dank_material_shell.nixosModules.dankMaterialShell
        inputs.dank_material_shell.nixosModules.greeter
        inputs.hjem.nixosModules.default
        inputs.mango.nixosModules.mango
        /etc/nixos/hardware-configuration.nix
      ]
      ++ (import_modules ./system)
      ++ (import_modules ./users);
      make_default = nixpkgs.lib.nixosSystem {
        modules = base_modules;
        specialArgs = { inherit inputs; };
      };
      make_intel = nixpkgs.lib.nixosSystem {
        modules = base_modules ++ [
          (
            { ... }:
            {
              eiros.system.hardware.cpu.vendor = "intel";
            }
          )
        ];
        specialArgs = { inherit inputs; };
      };
    in
    {
      nixosConfigurations = {
        default = make_default;
        intel = make_intel;
      };
    };
  inputs = {
    dank_material_shell = {
      url = "github:AvengeMedia/DankMaterialShell";
      #inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
