{ pkgs, ...}:

{
  programs = {
    tmux = {
      enable = true;
      mouse = true;
      prefix = "C-a";
      keyMode = "vi";
      baseIndex = 1;
      plugins = with pkgs.tmuxPlugins; [
        resurrect
        vim-tmux-navigator
        {
          plugin = tmux-nova;
          extraConfig = ''
            set -g @plugin 'o0th/tmux-nova'

            set -g @nova-nerdfonts true
            set -g @nova-nerdfonts-left 
            set -g @nova-nerdfonts-right 

            set -g @nova-pane-active-border-style "#44475a"
            set -g @nova-pane-border-style "#282a36"
            set -g @nova-status-style-bg "#4c566a"
            set -g @nova-status-style-fg "#d8dee9"
            set -g @nova-status-style-active-bg "#89c0d0"
            set -g @nova-status-style-active-fg "#2e3540"
            set -g @nova-status-style-double-bg "#2d3540"

            set -g @nova-pane "#I#{?pane_in_mode,  #{pane_mode},}  #W"

            set -g @nova-segment-mode "#{?client_prefix,Ω,ω}"
            set -g @nova-segment-mode-colors "#78a2c1 #2e3440"

            set -g @nova-segment-whoami "#(whoami)@#h"
            set -g @nova-segment-whoami-colors "#78a2c1 #2e3440"

            set -g @nova-rows 0
            set -g @nova-segments-0-left "mode"
            set -g @nova-segments-0-right "whoami"
          '';
        }
      ];
      extraConfig = ''
        bind -r k select-pane -U
        bind -r j select-pane -D
        bind -r h select-pane -L
        bind -r l select-pane -R
        # Make tmux use the correct colorscheme for neovim
        set-option -sa terminal-overrides ",xterm*:Tc"
        set-option -g set-clipboard on
      '';
    };
  };
}
