{ pkgs, ... }:

{
  # linux-specific packages

  home.packages = with pkgs; [
    # langs
    bazel
    bazelisk

    # cli
    below
    encfs
    libgbm
    libsecret
    lm_sensors
    sshfs
    xsensors

    # apps
    cobang # graphical qr code reader
    dropbox
    gnome-keyring
    gnomeExtensions.system-monitor
    libreoffice-fresh
    maestral # dropbox replacement
    maestral-gui
    media-downloader
    # speechd
    typora
  ];
}
