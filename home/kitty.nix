{ pkgs, ... }:

{
  programs.kitty = {
    extraConfig = ''
      # https://sw.kovidgoyal.net/kitty/conf/#advanced
      #
      # ctrl+shift+f2: Open editor with kitty conf file, creating it if doesn't already exist.
      # ctrl+shift+f5: Reload configuration.

      # key mappings
      #   windows:
      #     map ctrl+shift+enter new_window
      #     map ctrl+shift+w close_window
      #     map ctrl+shift+n new_os_window
      #     map ctrl+shift+] next_window
      #     map ctrl+shift+[ previous_window
      #   tabs:
      #     map ctrl+shift+t new_tab
      #     map ctrl+tab next_tab
      #     map ctrl+shift+tab previous_tab

      # windows:
      #   background_image        /Users/adamchalmers/Downloads/night_desert.png
      #   background_image_layout scaled
      #   background_tint         0.97
      #   background_tint_gaps    -10.0
      #   active_border_color     #44ffff
      #   single_window_margin_width 0

      # BEGIN_KITTY_THEME
      # Yorumi Shade
      include current-theme.conf
      # END_KITTY_THEME
    '';

    enable = true;
    package = pkgs.kitty;

    font = {
      name = "FiraCode Nerd Font Mono";
      size = 12.0;
    };

    settings = {
      # Use Wayland with automatic fallback to X11 for better WSLg compatibility
      linux_display_server = "auto";
      enable_audio_bell = false;

      # Performance optimizations for WSL
      sync_to_monitor = true;
      repaint_delay = 10;
      input_delay = 3;

      # Fix mouse cursor issues - disable blinking to prevent disappearing
      cursor_blink_interval = 0;

      # tab bar
      tab_bar_style = "powerline";
      tab_bar_min_tabs = 1;
      tab_powerline_style = "slanted";

      # windows
      window_margin_width = 4;
      window_border_width = "2pt";
      enabled_layouts = "Tall, *";

      # themeFile = "yorumi-shade";
    };
  };
}
