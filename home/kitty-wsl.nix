{ ... }:

{
  programs.kitty = {
    extraConfig = ''
      # Mac keyboard remapping for WSL
      # Fix: Key labeled ~/` producing </>, should produce `~
      map less send_text all `
      map shift+less send_text all ~

      # Fix: Key labeled §/± producing `~, should produce §±
      map grave send_text all §
      map shift+grave send_text all ±
    '';
  };
}
