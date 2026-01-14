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

  outputs =
    {
      nixpkgs,
      nix-darwin,
      home-manager,
      nix-homebrew,
      ...
    }:
    let
      # Common configuration values for each host
      hostConfigs = {
        mcfly = {
          username = "goyo";
          email = "jose.dinuncio@gmail.com";
          homeDirectory = "/home/goyo";
          system = "x86_64-linux";
          gnome = {
            textScalingFactor = 1.0;
          };
        };
        falcor = {
          username = "goyo";
          email = "jose.dinuncio@gmail.com";
          homeDirectory = "/home/goyo";
          system = "x86_64-linux";
          gnome = {
            textScalingFactor = 0.85; # Small screen, show more text
          };
        };
        bailey = {
          username = "goyo";
          email = "jose.dinuncio@gmail.com";
          homeDirectory = "/Users/goyo";
          system = "aarch64-darwin";
        };
        engywook = {
          username = "jose";
          email = "josedinunzio@microsoft.com";
          homeDirectory = "/Users/jose";
          system = "aarch64-darwin";
        };
      };
    in
    {

      # mcfly: goyo @ nixos + home-manager
      nixosConfigurations.mcfly = nixpkgs.lib.nixosSystem {
        specialArgs = hostConfigs.mcfly;
        modules = [
          ./hosts/mcfly
          ./users/goyo/nixos.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = hostConfigs.mcfly;
            home-manager.users.goyo = import ./users/goyo/home-linux.nix;
          }
        ];
      };

      # falcor: goyo @ nixos + home-manager
      nixosConfigurations.falcor = nixpkgs.lib.nixosSystem {
        specialArgs = hostConfigs.falcor;
        modules = [
          ./hosts/falcor
          ./users/goyo/nixos.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = hostConfigs.falcor;
            home-manager.users.goyo = import ./users/goyo/home-linux.nix;
          }
        ];
      };

      # bailey: goyo @ darwin + home-manager
      darwinConfigurations.bailey = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = hostConfigs.bailey;
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
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = hostConfigs.bailey;
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
        specialArgs = hostConfigs.engywook;
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
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = hostConfigs.engywook;
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
