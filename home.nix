{ config, pkgs, ... }:

{
  imports = [
    ./config/tmux.nix
    ./config/zsh.nix
    ./config/neovim.nix
  ];
  home = {
    username = "jgaither";
    homeDirectory = "/home/jgaither";
    stateVersion = "22.11";
    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    packages = with pkgs; [
      gcc
      hello
      vim
      tmux
      git
      meslo-lgs-nf
      zsh

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    ];
  };
  home.file = {
    #".zshrc".source = config/.zshrc;
    ".p10k.zsh".source = config/.p10k.zsh;
    #".tmux.conf".source = config/.tmux.conf;
    ".vimrc".source = config/.vimrc;
  };
  xdg.configFile = {
    nvim.source = config/.config/nvim;
    pypoetry.source = config/.config/pypoetry;
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jgaither/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
}
