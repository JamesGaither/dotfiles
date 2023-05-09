{ pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      gruvbox-material
      telescope-nvim
    ];
    extraConfig = ''
      :luafile ~/.config/nvim/init.lua
    '';
   };
}
