{ config, pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "nixos";
  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "nixos";

  imports = [
    # include NixOS-WSL modules
    # <nixos-wsl/modules>
    ../../system/nix.nix
    ../../system/nix-extra-options.nix
    # ../../system/config-linux.nix
    ../../system/packages-linux.nix
  ];

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "gb";
    xkb.variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable fish shell
  programs.fish.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  # system.stateVersion = "25.05"; # Did you read the comment?

}
