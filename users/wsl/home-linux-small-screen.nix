{ username, homeDirectory, ... }:

{
  home.username = username;
  home.homeDirectory = homeDirectory;

  imports = [
    ./home-linux.nix
    # gnome.nix is already imported by home-linux.nix
    # textScalingFactor is controlled via flake.nix hostConfigs
  ];

}
