{ config, pkgs, ... }:

{
  imports = [
    ./config/tmux.nix
    ./config/zsh.nix
    ./config/nvim/neovim.nix
  ];
  home = {
    username = "jgaither";
    homeDirectory = "/home/jgaither";
    stateVersion = "22.11";
    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    packages = with pkgs; [
      gcc
      vim
      tmux
      git
      minicom
      meslo-lgs-nf
      ripgrep
      python311 
      poetry
    ];
    shellAliases = {
      g = "git";
    };
  };
  home.file = {
    ".p10k.zsh".source = config/.p10k.zsh;
    ".vimrc".source = config/.vimrc;
  };
  xdg.configFile = {
    nvim = {
      source = config/nvim/lua;
      recursive = true;
    };
    pypoetry.source = config/.config/pypoetry;
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jgaither/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
}
