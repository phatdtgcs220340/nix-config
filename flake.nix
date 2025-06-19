{
  description = "Phat Do's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    ibus-bamboo.url = "github:BambooEngine/ibus-bamboo";
  };

  outputs = { 
    nixpkgs, 
    home-manager, 
    ibus-bamboo,
    ... 
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.phatdo-hp-15s = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/phatdo-hp-15s/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.phatdo = import ./home/users/phatdo.nix;
          }
        ];
      };
    };
}

