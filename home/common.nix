{ pkgs, ... }:

{
  # packages common to linux and darwin

  home.packages = with pkgs; [
    # langs
    cargo
    gcc
    ghc
    python313
    python313Packages.pip
    # go
    go
    mage
    #nodejs_23
    protobuf
    protoc-gen-go
    grpcui

    # devel
    gnumake42
    httpie
    k3d
    kind
    krew
    ruff

    # cli
    ack
    bat
    devbox
    devenv
    ffmpeg
    fzf
    fishPlugins.grc
    gh
    gifsicle
    grc
    imagemagick
    just
    jq
    mmv-go
    nil
    nixfmt
    nixVersions.nix_2_28
    rar
    rdfind
    # kitty
    ty
    video-downloader
    wmctrl
    yazi
    yq
    yt-dlp

    # apps
    brave
    comical
    firefox
    helix
    # jetbrains.idea-community
    #jetbrains.goland
    jetbrains.pycharm
    mpv
    #steam

    # libs
    libwebp
    zlib

    # lsp
    docker-language-server
    docker-compose-language-service
    fish-lsp
    just-lsp
    jq-lsp
    python313Packages.jedi-language-server
    python313Packages.python-lsp-server
    taplo
    temurin-jre-bin-21
    tombi
    superhtml
    vscode-langservers-extracted
    yaml-language-server
  ];
}
