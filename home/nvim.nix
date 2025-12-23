{ config, pkgs, ... }: let
  nvimPath = "${config.home.homeDirectory}/.config/nix-config/home/dotfiles/nvim";
in
{
  # Configuration to install neovim and use lazyvim with it.
  # * Install neovim from unstable.
  # * Does not configure neovim using home-manager module.
  # * Install packages used by lazyvim and the chosen plugins.
  # * Neovim's `nvim` config folder moved to this repo, to keep
  #   configuration in the same place.
  #
  # Usage Notes:
  #   Inside Vim:
  #     - `:LazyHealth` or `:checkhealth` command to check lazyvim health.
  #     - `:Lazy` to interact with lazyvim.
  #   In Console:
  #     - `nvim --headless "+Lazy! sync" +qa` to update plugins
  #     - in case of trouble, `rm -rf ~/.local/{state,share}/nvim`

  home.packages = with pkgs; [
      lua51Packages.lua
      luarocks-nix
      fd
      lazygit
      # neovim
      tree-sitter
      ripgrep
      vimPlugins.nvim-treesitter
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile.nvim.source = config.lib.file.mkOutOfStoreSymlink nvimPath;
}
