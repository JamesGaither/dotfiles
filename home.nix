{ config, pkgs, ... }: #dotfiles

{
  imports = [
    ./config/tmux.nix
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
  # The home.packages option allows you to install Nix packages into your
  # environment.
    packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
      gcc
      hello
      neovim
      tmux
      git

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
    ".zshrc".source = config/.zshrc;
    ".p10k.zsh".source = config/.p10k.zsh;
    #".tmux.conf".source = config/.tmux.conf;
    ".zsh" = {
      source = config/.zsh;
      recursive = true;
    };

  };
  xdg.configFile = {
    nvim.source = config/.config/nvim;
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
}
