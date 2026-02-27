{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # Basic fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf

    # Monospace fonts for terminals
    fira-code
    fira-code-symbols

    # Nerd Fonts - includes FiraCode Nerd Font Mono for kitty
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono

    # Additional monospace fonts
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];
}
