{ lib, ... }:
{
  programs.fish.shellInit = lib.mkAfter ''
    set -x fish_user_paths /usr/local/bin $fish_user_paths
  '';

  programs.fish.functions.office = ''
    set -l init /Users/jose/office/src/init.fish
    if not test -f $init
      echo "office: init.fish not found at $init" >&2
      return 1
    end
    source $init
  '';
}
