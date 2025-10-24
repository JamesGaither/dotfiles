{ pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      tree-sitter
      pyright
      lua-language-server
      gopls
    ];
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      telescope-nvim
      telescope-fzf-native-nvim
      plenary-nvim
      onenord-nvim
      gitsigns-nvim
      undotree
      nvim-lspconfig
      blink-cmp
      luasnip
      vim-tmux-navigator
      nvim-autopairs
      oil-nvim
      # Devicons required by oil
      nvim-web-devicons
    ];
    extraConfig = ''
      :luafile ~/.config/nvim/init.lua
    '';
  };
  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
