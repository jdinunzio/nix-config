{ ... }:

{
  home.username = "goyo";
  home.homeDirectory = "/home/goyo";

  imports = [
    ./home-linux.nix
    ../../home/small-screen.nix
  ];

}
