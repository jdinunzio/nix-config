{ lib, ... }:
{
  programs.git.settings = {
    credential.helper = "manager";
    credential.useHttpPath = true;
  };

  # GCM calls `git config --global` to store per-org credential settings.
  # home-manager's ~/.config/git/config is a read-only nix store symlink.
  # When ~/.gitconfig exists, git config --global writes there instead.
  home.activation.gcmWritableGitConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -f "$HOME/.gitconfig" ]; then
      run touch "$HOME/.gitconfig"
    fi
  '';
}
