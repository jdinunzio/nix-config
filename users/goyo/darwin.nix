{ pkgs, ... }:
{
  users.knownUsers = [ "goyo" ];
  users.users.goyo.uid = 501;
  users.users.goyo.home = "/Users/goyo";
  users.users.goyo.shell = pkgs.fish;

  system.primaryUser = "goyo";
}
