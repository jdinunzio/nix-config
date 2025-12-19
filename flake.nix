{
  description = "NixOs, Darwin-Nix, and Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {

    # mcfly: goyo @ nixos + home-manager
    nixosConfigurations.mcfly = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/mcfly
        ./users/goyo/nixos.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.goyo = import ./users/goyo/home.nix;
        }
      ];
    };
    
  };
}
