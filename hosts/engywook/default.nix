{ pkgs, ... }: {

  imports =
    [
      ../../system/nix.nix
      ../../system/nix-extra-options.nix
      ../../system/config-darwin.nix
      ../../system/packages-darwin.nix
    ];

}
