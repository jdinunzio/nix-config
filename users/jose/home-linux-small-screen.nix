{ ... }:

{
  home.username = "jose";
  home.homeDirectory = "/home/jose";

  imports = [
    ./home-linux.nix
    ../../home/small-screen.nix
  ];

}
