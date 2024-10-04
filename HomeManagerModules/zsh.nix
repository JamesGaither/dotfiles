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
      
      # SSH aliases
      achilles = "ssh achilles";
      anemoi = "ssh anemoi";
      apollo = "ssh apollo";
      atlas = "ssh atlas";
      fb1 = "ssh fastbox1";
      fb2 = "ssh fastbox2";
      reds = "ssh red";
      rocketman = "ssh rocketman";
      hermes = "ssh hermes";
      metis = "ssh 172.16.20.20";
      zeus = "ssh zeus";
    };
    initExtra = ''
      export PYENV_ROOT="$HOME/.pyenv"
      if [[ -d $PYENV_ROOT/bin ]]; then
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)" 
      fi
      export PATH=$PATH:~/bin
    '';
  };
}
