{
  description = "Eiros: A NixOS configuration using MangoWC";
  outputs =
    {
      dank_material_shell,
      eiros_users,
      hjem,
      mango,
      nixos_hardware,
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
        inputs.hjem.nixosModules.default
        inputs.mango.nixosModules.mango
        /etc/nixos/hardware-configuration.nix
      ]
      ++ (import_modules ./system)
      ++ (import_modules ./users)
      ++ eiros_users.nixosModules.default;
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
      make_framework_16 = nixpkgs.lib.nixosSystem {
        modules =
          base_modules
          ++ [
            (
              { ... }:
              {
                eiros.system.hardware.graphics.nvidia.enable = false;
              }
            )
          ]
          ++ [ nixos_hardware.nixosModules.framework-16-7040-amd ];
      };
    in
    {
      nixosConfigurations = {
        default = make_default;
        intel = make_intel;
        fw16 = make_framework_16;
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
    nixos_hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=25.11";
    };
    eiros_users = {
      url = "github:lcleveland/eiros.users";
    };
  };
}
