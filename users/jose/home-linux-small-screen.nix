{ ... }:

{
  home.username = "jose";
  home.homeDirectory = "/home/jose";

  imports = [
    ./home-linux.nix
    # gnome.nix is already imported by home-linux.nix
    # textScalingFactor is controlled via flake.nix hostConfigs
  ];

}
