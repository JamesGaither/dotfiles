{ pkgs, ...}:

{ 
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."*" = {
      ServerAliveInterval = 60;
      ServerAliveCountMax = 3;
    };
    extraConfig = ''
      Include ~/.ssh/config.local
    '';
  };

}
