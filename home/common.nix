{ pkgs, ... }:

{
  # packages common to linux and darwin

  home.packages = with pkgs; [
      # langs
      cargo
      gcc
      ghc
      python312
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
      gnupg
      grc
      imagemagick
      just
      jq
      mmv-go
      nil
      nixVersions.nix_2_28
      pass
      pinentry-tty
      rar
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
      jetbrains.idea-community
      #jetbrains.goland
      jetbrains.pycharm-community-bin
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
      python312Packages.pip
      python312Packages.python-lsp-server
      taplo
      temurin-jre-bin-21
      tombi
      superhtml
      vscode-langservers-extracted
      yaml-language-server
    ];
}
