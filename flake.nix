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
  }: let
    system = "x86_64-linux";
    bamboo = ibus-bamboo.packages.${system}.default;
  in {
    nixosConfigurations = {
      phatdo-hp-15s = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/phatdo-hp-15s/configuration.nix
          ./modules/ibus-bamboo.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {
              bamboo = bamboo;
            };

            home-manager.users.phatdo = import ./home/users/phatdo.nix;
          }
        ];
        specialArgs = {
          inherit bamboo;
        };
      };
    };
  };
}
