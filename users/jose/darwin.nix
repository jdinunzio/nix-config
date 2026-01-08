{ pkgs, ... }:
{
  users.knownUsers = [ "jose" ];
  users.users.jose.uid = 501;
  users.users.jose.home = "/Users/jose";
  users.users.jose.shell = pkgs.fish;

  system.primaryUser = "jose";
}
