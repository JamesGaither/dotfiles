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
      
      # SSH aliases
      achilles = "ssh achilles";
      aether = "ssh 10.21.5.30";
      anemoi = "ssh anemoi";
      apollo = "ssh apollo";
      atlas = "ssh atlas";
      fb1 = "ssh fastbox1";
      fb2 = "ssh fastbox2";
      red-server = "ssh red";
      hermes = "ssh hermes";
      metis = "ssh 10.21.5.20";


    };
  };
}
