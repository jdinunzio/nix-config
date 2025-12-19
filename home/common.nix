{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # langs
      cargo
      gcc
      ghc
      python312
      # go
      bazel
      bazelisk
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
      below
      devbox
      devenv
      encfs
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
      lm_sensors
      mmv-go
      nil
      nixVersions.nix_2_28
      pass
      pinentry-tty
      rar
      # kitty
      ty
      vdhcoapp
      video-downloader
      wmctrl
      xsensors
      yazi
      yq
      yt-dlp
      
      # apps
      brave
      comical
      dropbox
      firefox
      gnomeExtensions.system-monitor
      helix
      jetbrains.idea-community
      #jetbrains.goland
      jetbrains.pycharm-community-bin
      libreoffice-fresh
      maestral  # dropbox replacement
      maestral-gui
      media-downloader
      mpv
      #steam
      speechd
      typora

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
