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
    lm_sensors
    sshfs
    vdhcoapp
    xsensors

    # apps
    dropbox
    gnomeExtensions.system-monitor
    libreoffice-fresh
    maestral # dropbox replacement
    maestral-gui
    media-downloader
    # speechd
    typora
  ];
}
