{ pkgs, ...}:

{
  
  environment.systemPackages = with pkgs; [
    # langs
    cargo
    gcc
    ghc
    #python313Full
    python313
    python313Packages.jedi-language-server
    python313Packages.python-lsp-server
    python313Packages.pip
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
}
