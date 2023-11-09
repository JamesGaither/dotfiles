{ pkgs, ...}:

{
  programs = {
    tmux = {
      enable = true;
      mouse = true;
      prefix = "C-a";
      keyMode = "vi";
      baseIndex = 1;
      plugins = with pkgs; [
        tmuxPlugins.resurrect
      ];
      extraConfig = ''
        bind -r k select-pane -U
        bind -r j select-pane -D
        bind -r h select-pane -L
        bind -r l select-pane -R
        # Make tmux use the correct colorscheme for neovim
        set-option -sa terminal-overrides ",xterm*:Tc"
      '';
    };
  };
}
