{ pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    history = {
      share = true;
    };
    shellAliases = {
      grep = "grep --color=auto";
      ls = "ls --color=auto";
      ll = "ls -alF";
      l = "ll";
      history = "history 1"; # Show all history
      hs = "history";
    };

    initExtra = "
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ~/.p10k.zsh
    ";
  };
}
