{
  lib,
  osConfig ? { },
  pkgs,
  ...
}:

let
  zipGeeqie = pkgs.writeShellApplication {
    name = "zip-geeqie";
    runtimeInputs = with pkgs; [
      coreutils
      geeqie
      mount-zip
    ];
    text = builtins.readFile ./dotfiles/scripts/zip-geeqie;
  };
in
{
  config = lib.mkIf (pkgs.stdenv.hostPlatform.isLinux && (osConfig.programs.fuse.enable or false)) {
    home.file.".local/bin/zip-geeqie" = {
      source = lib.getExe zipGeeqie;
      executable = true;
    };

    programs.yazi = {
      enable = true;
      shellWrapperName = "yy";
      enableBashIntegration = false;
      enableFishIntegration = false;
      enableNushellIntegration = false;
      enableZshIntegration = false;

      keymap.mgr.prepend_keymap = [
        {
          on = [
            "g"
            "z"
          ];
          run = ''shell --block -- "$HOME/.local/bin/zip-geeqie" %h'';
          desc = "Mount ZIP and view in Geeqie";
        }
      ];
    };
  };
}
