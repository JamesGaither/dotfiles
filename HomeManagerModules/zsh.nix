{ pkgs, ...}:

{
  
  programs.zsh = {
    enable = true;
    history = {
      share = true;
      extended = true;
    };
    autosuggestion.enable = true;
    
    shellAliases = {
      grep = "grep --color=auto";
      ls = "ls --color=auto";
      ll = "ls -alF";
      l = "ll";
      history = "history -f 1"; # Show all history
      hs = "history";

      # Tmux shortcuts 
      tm = "tmux";
      tma = "tmux attach-session";
      tmat = "tmux attach-session -t";
      tml = "tmux list-session";
      tmn = "tmux new-session";
      
      # Git shortcuts
      g = "git";
      glog = "git log --oneline --graph --decorate --all";

    };
    initContent = ''
      source ${./shell-functions.sh}
      export PYENV_ROOT="$HOME/.pyenv"
      if [[ -d $PYENV_ROOT/bin ]]; then
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)" 
      fi
      export PATH=$PATH:~/bin:~/.cargo/bin
      export PATH=$PATH:~/.local/bin/
      export LIBVIRT_DEFAULT_URI="qemu:///system"
    '';
  };
}
