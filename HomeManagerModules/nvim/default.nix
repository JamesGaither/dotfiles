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
    ];
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      telescope-nvim
      plenary-nvim
      onenord-nvim
      gitsigns-nvim
      undotree
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
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
