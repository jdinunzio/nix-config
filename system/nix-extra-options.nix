{ config, pkgs, ... }:

{
  # nix extra options: this file is kept with a null value in git, but
  # it's intended to be ovewritten locally with a github token
  nix.extraOptions = ''
  '';
}
