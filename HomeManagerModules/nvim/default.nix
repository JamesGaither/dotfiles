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
    ];
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      telescope-nvim
      plenary-nvim
      onenord-nvim
      gitsigns-nvim
      undotree
      nvim-lspconfig
      blink-cmp
      luasnip
      vim-tmux-navigator
      nvim-autopairs
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
