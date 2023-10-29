{ pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    coc.enable = true;
    extraPackages = with pkgs; [
      tree-sitter
    ];
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      telescope-nvim
      plenary-nvim
      onenord-nvim
      gitsigns-nvim
      undotree
      coc-rust-analyzer
      coc-python
    ];
    extraConfig = ''
      :luafile .config/nvim/lua/init.lua
    '';
   };
}
