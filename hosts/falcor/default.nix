# falcor configuration: asus
{ config, pkgs, ... }:

{
  networking.hostName = "falcor";

  imports = [
    ./hardware-configuration.nix
    ../../system/nix.nix
    ../../system/nix-extra-options.nix
    ../../system/config-linux.nix
    ../../system/packages-linux.nix
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "us";
}
