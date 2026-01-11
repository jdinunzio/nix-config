{ config, pkgs, ... }:

{
  networking.hostName = "mcfly";
  
  imports =
    [
      # host specific hardware configuration
      ./hardware-configuration.nix
      ../../system/nix.nix
      ../../system/nix-extra-options.nix
      ../../system/config-linux.nix
      ../../system/packages-linux.nix
    ];


  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "gb";
    xkb.variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";
}
