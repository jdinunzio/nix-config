{ pkgs, ... }:

{
  # linux-specific packages

  home.packages = with pkgs; [
    # langs
    #bazel
    #bazelisk

    # cli
    below
    dotool  # keyboard+mouse macro
    # busybox  # for fuser, but overides other tools
    #encfs
    git-credential-oauth
    gocryptfs
    hdparm
    libgbm
    libsecret
    lm_sensors
    lsof
    mount-zip
    #ntfs3g
    ntfsprogs-plus
    piper-tts # text-to-voice
    smartmontools
    sshfs
    video-downloader
    xsensors
    
    # task warrior
    # taskopen (nix refuses to compile)

    # apps
    chromium
    cobang # graphical qr code reader
    dropbox
    gnome-keyring
    gnomeExtensions.system-monitor
    inotify-tools
    kdePackages.gwenview  # gif viewer
    libreoffice-stable
    maestral # dropbox replacement
    maestral-gui
    media-downloader
    # speechd
    typora
    synfigstudio

    # steam-run to allow running downloaded binaries
    # use: steam-run the-dynamic-linked-app
    (steam.override {
      extraPkgs = p: [ p.gtk3 ];
    }).run
  ];
}
