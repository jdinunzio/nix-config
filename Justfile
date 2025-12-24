# This help.
@help:
    just --list

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

# Delete specific nixos generations.
[group("os"), linux]
os-gen-del GENS:
    sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations {{GENS}}

# Garbage collection.
[group("nix")]
garbage-collect:
    nix-collect-garbage

# Store optimise.
[group("nix")]
store-optimise:
    nix store optimise
