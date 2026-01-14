{ username, homeDirectory, ... }:

{
  home.username = username;
  home.homeDirectory = homeDirectory;

  imports = [
    ../../home/common.nix
    ../../home/darwin.nix
    ../../home/direnv.nix
    ../../home/dotfiles.nix
    ../../home/fish.nix
    ../../home/git-jose-mac.nix
    ../../home/gpg.nix
    ../../home/helix.nix
    ../../home/kitty.nix
    ../../home/nvim.nix
    ../../home/shell.nix
    ../../home/ssh.nix
    ../../home/vscode.nix
  ];

  # You should not change this value.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.language = {
    collate = "C";
  };

  home.sessionVariables = {
    LC_COLLATE = "C";
  };

  dconf.settings = {
    "org.gnome.desktop.wm.keybindings" = {
      switch-group = [ "<Super>Above_Tab" ];
    };
  };

  # Let Home Manager install and manage itself (only if `useGlobalPkgs` is false).
  # nixpkgs.config = {
  #   allowUnfree = true;
  #   allowUnfreePredicate = (_: true);
  # };
  programs.home-manager.enable = true;
}
