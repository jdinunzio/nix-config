# This help.
@help:
    just --list

#
#  NixOs targets
#

# Rebuild the system.
[group("os"), linux]
os-rebuild:
    sudo nixos-rebuild switch --flake ~/.config/nix-config/

# Update the system.
[group("os"), linux]
os-update:
    nix flake update

# Update and rebuild the system.
[group("os"), linux]
os-update-and-rebuild:
    sudo nixos-rebuild switch --recreate-lock-file --flake ~/.config/nix-config/

# List nixos generations.
[group("os"), linux]
os-gen-ls:
    nixos-rebuild list-generations


#
#  Nix Darwin targets
#

# Rebuild the system.
[group("os"), macos]
os-rebuild:
    sudo darwin-rebuild switch --flake ~/.config/nix-config/


# List nix darwin generations.
[group("os"), macos]
os-gen-ls:
    sudo darwin-rebuild --list-generations


#
#  OS generic targets, both for NixOS and  Darwin
#

# Bootstrap
[group("os")]
bootstrap:
    mkdir -p ~/.config/nix-config
    cd ~/.config/nix-config and git clone https://github.com/jdinunzio/nix-config
    sudo -i nix run --extra-experimental-features nix-command --extra-experimental-features flakes nix-darwin -- switch --flake ~/.config/nix-config

# Delete specific nixos generations.
[group("os")]
os-gen-del GENS:
    sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations {{GENS}}


#
#  Nix targets
#

# Garbage collection.
[group("nix")]
garbage-collect:
    nix-collect-garbage

# Store optimise.
[group("nix")]
store-optimise:
    nix store optimise
