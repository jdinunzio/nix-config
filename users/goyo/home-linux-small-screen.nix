{ username, homeDirectory, ... }:

{
  home.username = username;
  home.homeDirectory = homeDirectory;

  imports = [
    ./home-linux.nix
    ../../home/small-screen.nix
  ];

}
