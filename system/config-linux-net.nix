{ config, pkgs, ... }:

{
  # Network configuration for physical Linux systems
  # Contains configuration that CANNOT run in WSL or other containerized environments
  # This enables NetworkManager which pulls in wpa_supplicant as a dependency
  # Only import this module for physical hardware (not WSL, VMs, containers, etc.)
  networking.networkmanager.enable = true;
}
