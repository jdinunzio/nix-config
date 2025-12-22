{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    gnupg
    pass
    passExtensions.pass-otp
    # pinentry-tty
    pinentry-curses
    # pinentry-gnome3
    # pinentry-dmenu
    zbar  # Bar code reader, helps registering otp
  ];

  programs.gpg = {
    enable = true;
    # homedir = "${config.home.homeDirectory}/.config/gnupg";
    mutableKeys = true;
    mutableTrust = true;
  };

  services.gpg-agent = {
    enable = true;
    enableFishIntegration = true;
    pinentry.package = pkgs.pinentry-curses;
    pinentry.program = "pinentry-curses";
  };
}
