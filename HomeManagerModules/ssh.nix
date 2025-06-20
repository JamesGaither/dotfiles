{ pkgs, ...}:

{ 
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Include ~/.ssh/config.local
    '';
  };

}
