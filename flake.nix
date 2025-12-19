{
  description = "NixOs, Darwin-Nix, and Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nix-darwin, home-manager, ... }: {

    # mcfly: goyo @ nixos + home-manager
    nixosConfigurations.mcfly = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/mcfly
        ./users/goyo/nixos.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.goyo = import ./users/goyo/home-linux.nix;
        }
      ];
    };

    # bailey: goyo @ darwin + home-manager
    darwinConfigurations.bailey = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/bailey
        ./users/goyo/darwin.nix

        home-manager.darwinModules.home-manager
        {
          nixpkgs = {
            config = {
              allowUnfree = true;
            };
          };
          # `home-manager` config
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.goyo = import ./users/goyo/home-darwin.nix;
        }
       ];
    };

  };
}
