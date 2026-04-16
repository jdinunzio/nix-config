{ pkgs, ... }:

{
  # linux-specific packages

  home.packages = with pkgs; [
    # langs
    bazel
    bazelisk

    # cli
    piper-tts # text-to-voice
    below
    encfs
    libgbm
    libsecret
    lm_sensors
    sshfs
    xsensors

    # apps
    chromium
    cobang # graphical qr code reader
    dropbox
    gnome-keyring
    gnomeExtensions.system-monitor
    kdePackages.gwenview  # gif viewer
    libreoffice-fresh
    maestral # dropbox replacement
    maestral-gui
    media-downloader
    # speechd
    typora
  ];
}
