{ pkgs, ...}:

{
  programs = {
    tmux = {
      enable = true;
      mouse = true;
      prefix = "C-a";
      plugins = with pkgs; [
        tmuxPlugins.resurrect
      ];
      extraConfig = ''
        bind -r k select-pane -U
        bind -r j select-pane -D
        bind -r h select-pane -L
        bind -r l select-pane -R
      '';
    };
  };
}
