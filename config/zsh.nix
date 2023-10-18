{ pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    history = {
      share = true;
    };
    enableAutosuggestions = true;
    shellAliases = {
      grep = "grep --color=auto";
      ls = "ls --color=auto";
      ll = "ls -alF";
      l = "ll";
      history = "history 1"; # Show all history
      hs = "history";
    };
  };
}
