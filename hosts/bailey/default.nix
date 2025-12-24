{ pkgs, ... }: {

  imports =
    [
      ../../system/nix.nix
      ../../system/nix-extra-options.nix
    ];

  system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;

  environment.systemPackages = with pkgs; [
    # langs
    cargo
    gcc
    ghc
    #python313Full
    python312
    python313Packages.jedi-language-server
    python312Packages.python-lsp-server
    python312Packages.pip
    temurin-jre-bin-21
    # go
    #bazel
    #bazelisk
    go
    mage
    # nodejs_23
    protobuf
    protoc-gen-go
    grpcui

    # lsp
    docker-language-server
    docker-compose-language-service
    fish-lsp
    just-lsp
    jq-lsp
    taplo
    tombi
    superhtml
    vscode-langservers-extracted
    yaml-language-server

    # devel
    awscli2
    azure-cli
    azure-cli-extensions.account
    circleci-cli
    copilot-cli
    coreutils
    devbox
    devenv
    docker
    docker-compose
    git
    git-credential-manager
    # google-cloud-sdk-gce
    gnumake42
    httpie
    k3d
    kind
    krew
    ruff
    #terraform
    #terragrunt
    ssm-session-manager-plugin

    # cli
    ack
    bat
    fzf
    fishPlugins.grc
    gifsicle
    gh
    gnugrep
    gnused
    grc
    helix
    jq
    just
    mmv-go
    neovim
    pgcli
    pstree
    rar
    yq

    just
    kitty
    nil
    ty
    yazi

    # apps
    iterm2

    # libs
    libwebp
    zlib
  ];

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
