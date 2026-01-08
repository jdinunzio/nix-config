{ pkgs, ... }:
{
  users.users.jose = {
    isNormalUser = true;
    description = "jose";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
    ];
    shell = pkgs.fish;
  };

}
