{ pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      tree-sitter
    ];
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      gruvbox-material
      telescope-nvim
      plenary-nvim
      onenord-nvim
      gitsigns-nvim
      undotree
    ];
    extraConfig = ''
      :luafile .config/nvim/init.lua
    '';
   };
}
