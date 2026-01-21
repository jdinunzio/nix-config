{
  pkgs,
  username,
  homeDirectory,
  ...
}:
{
  users.knownUsers = [ username ];
  users.users.${username} = {
    uid = 501;
    home = homeDirectory;
    shell = pkgs.fish;
  };

  system.primaryUser = username;
}
