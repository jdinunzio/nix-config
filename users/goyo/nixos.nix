{ pkgs, ... }:
{
  users.users.goyo = {
    isNormalUser = true;
    description = "goyo";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
    ];
    shell = pkgs.fish;
  };

}
