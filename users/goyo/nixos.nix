{ pkgs, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [
    ];
    shell = pkgs.fish;
  };

}
