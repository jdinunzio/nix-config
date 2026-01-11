{
  description = "NixOs, Darwin-Nix, and Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nix-darwin, home-manager, nix-homebrew, ... }: {

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

    # falcor: goyo @ nixos + home-manager
    nixosConfigurations.falcor = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/falcor
        ./users/goyo/nixos.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.goyo = import ./users/goyo/home-linux-small-screen.nix;
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

        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            user = "goyo";
            enableRosetta = true;
          };
        }
      ];
    };

    # engywook: jose @ darwin + home-manager
    darwinConfigurations.engywook = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/engywook
        ./users/jose/darwin.nix

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
          home-manager.users.jose = import ./users/jose/home-darwin.nix;
        }
       
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            user = "jose";
            enableRosetta = true;
          };
        }
      ];
    };

  };
}
