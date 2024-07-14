{ config, pkgs, ... }:

{
  imports = [
    ./config/tmux.nix
    ./config/zsh.nix
    ./config/starship.nix
    ./config/nvim
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
      vim
      tmux
      git
      minicom
      meslo-lgs-nf
      ripgrep
      rustup
      #(python311.withPackages(ps: with ps; [ pytz numpy python-redmine]))
    ];

  };
  xdg.configFile = {
    #pypoetry.source = config/.config/pypoetry;
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
  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    autojump.enable = true;
    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
  fonts.fontconfig.enable = true;
}
