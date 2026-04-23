{ pkgs, lib, ... }:

{
  # Core Linux system configuration
  # Can be applied to NixOS both in and out of WSL
  # For physical hardware networking (NetworkManager), see config-linux-net.nix

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Open ports in the firewall.
  networking.firewall = {
    allowedTCPPorts = [ 17500 ];
    allowedUDPPorts = [ 17500 ];
  };

  virtualisation.docker.enable = true;

  security.rtkit.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Services

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Use GTK portal backend for file chooser to avoid ~1s save dialog latency
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common."org.freedesktop.impl.portal.FileChooser" = "gtk";

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.openssh.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    allowInterfaces = [ "wlp64s0" ];
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      userServices = true;
      workstation = true;
    };
  };

  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=60
    Defaults timestamp_type=global
  '';

  #
  # Programs
  #

  programs.fish = {
    enable = true;
  };

  # enable dynamic links
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
  ];

  # ssh config to remember passphrases (in console, alternative to gnome config)
  #programs.ssh = {
  #  startAgent = true;
  #  agentTimeout = "20m";
  #  extraConfig = ''
  #  AddKeysToAgent yes
  #  '';
  #};

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.evince.enable = true;

  #
  # systemd
  #

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          meta = "overload(mac, meta)";
        };
        mac = {
          left  = "C-a";
          right = "C-e";
          up    = "C-home";
          down  = "C-end";
          c = "C-c";  v = "C-v";  x = "C-x";
          z = "C-z";  a = "C-a";  s = "C-s";
          f = "C-f";  t = "C-t";  w = "C-w";
          n = "C-n";  q = "C-q";
        };
      };
    };
  };

  systemd.user.services.maestral = {
    enable = true;
    after = [ "network.target" ];
    wantedBy = [ "default.target" ];
    description = "Maestral (free Dropbox)";
    serviceConfig = {
      Type = "simple";
      ExecStart = ''/run/current-system/sw/bin/maestral start'';
    };
  };

  #
  # Other config
  #

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];


  # Do not change this value. Read `man configuration.nix`
  # or https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
