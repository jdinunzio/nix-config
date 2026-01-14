{ pkgs, ... }:

{
  # System-level packages for macOS
  # User packages (languages, dev tools, LSPs, CLI tools) are in home/common.nix

  environment.systemPackages = with pkgs; [
    # Cloud CLIs & deployment tools
    awscli2
    azure-cli
    azure-cli-extensions.account
    circleci-cli
    copilot-cli
    ssm-session-manager-plugin

    # Core system utilities
    coreutils
    gnugrep
    gnused

    # Docker & container tools
    docker
    docker-compose

    # Git & credentials
    git
    git-credential-manager

    # System-level CLI tools
    neovim
    pgcli
    pstree

    # Terminal emulators (system-wide)
    kitty
    iterm2
  ];
}
