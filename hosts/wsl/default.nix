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
    ../../system/fonts.nix
    ../../system/packages-linux.nix
  ];

  # Configure keymap in X11 (Mac keyboard layout)
  services.xserver = {
    xkb.layout = "gb";
    xkb.variant = "mac";
    xkb.model = "apple_laptop";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable fish shell
  programs.fish.enable = true;

  # Enable PC/SC-Lite daemon for smart card support
  services.pcscd.enable = true;

  # Enable YubiKey support
  services.udev.packages = [ pkgs.yubikey-personalization ];

  # Add helpful YubiKey tools (optional)
  environment.systemPackages = with pkgs; [
    yubikey-manager
    yubikey-personalization
  ];

  # Enable dynamic linking for non-NixOS binaries (e.g., agency tool)
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # C/C++ runtime
    stdenv.cc.cc.lib
    glibc

    # Common libraries for compiled binaries
    zlib
    openssl
    curl
    libgcc

    # Additional runtime libraries
    gcc-unwrapped.lib

    # Development libraries often dynamically linked
    libxml2
    libxcrypt
  ];
}
