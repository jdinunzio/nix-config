{ pkgs, ... }: {

  imports =
    [
      ../../system/nix.nix
      ../../system/nix-extra-options.nix
      ../../darwin.nix
    ];

  system.defaults = {
    NSGlobalDomain."com.apple.swipescrolldirection" = false;
    dock.autohide = true;
  };


  homebrew.casks = [
    "alt-tab"
    "firefox"
    "microsoft-teams"
    # "vscode"
  ];

  # Enable alternative shell support in nix-darwin.
  programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # nixpkgs.config = {
  #   allowUnfree = true;
  # };
}
