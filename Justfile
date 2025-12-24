# This help.
@help:
    just --list

# Rebuild the system.
[group("os")]
[linux]
os-rebuild:
    sudo nixos-rebuild switch --flake ~/.config/nix-config/
