{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # console apps
    dropbox-cli
    fish
    fishPlugins.grc
    helix
    killall
    maestral
    mplayer

    # graphical apps
    chromium
    evince
    firefox
    geeqie
    dconf-editor
    gnome-control-center
    gnome-tweaks
    gnomeExtensions.freon
    google-chrome
    kdePackages.kdenlive
    libreoffice
    steam-run
    vlc
    xorg.xkill
    zoom-us

    # cli tools
    ack
    bat
    btop
    curl
    docker
    encfs
    file
    git
    grc
    htop
    jq
    libuuid
    pstree
    rsync
    tmux
    tree
    unzip
    webex
    wget
    yq
    xsel
    zip

    # libs
    openssl
  ];
}
