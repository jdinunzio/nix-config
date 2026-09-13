{ pkgs, ... }:

{
  home.packages = [
    pkgs.git-credential-oauth
  ];

  programs.git.settings.credential.helper = [
    "cache --timeout 21600"
    "oauth"
  ];
}
