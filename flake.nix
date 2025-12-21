{
  description = "Eiros: A NixOS configuration using MangoWC";
  outputs =
    {
      dank_material_shell,
      eiros_hardware,
      eiros_users,
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
        inputs.dank_material_shell.nixosModules.dank-material-shell
        inputs.dank_material_shell.nixosModules.greeter
        inputs.eiros_hardware.nixosModules.default
        inputs.hjem.nixosModules.default
        inputs.mango.nixosModules.mango
      ]
      ++ (import_modules ./system)
      ++ (import_modules ./users)
      ++ eiros_users.nixosModules.default;
      make_default = nixpkgs.lib.nixosSystem {
        modules = base_modules;
        specialArgs = { inherit inputs; };
      };
    in
    {
      nixosConfigurations = {
        default = make_default;
      };
    };
  inputs = {
    dank_material_shell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
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
      url = "github:nixos/nixpkgs?ref=25.11";
    };
    eiros_users = {
      url = "github:lcleveland/eiros.users";
    };
    eiros_hardware = {
      url = "github:lcleveland/eiros.hardware";
    };
  };
}
