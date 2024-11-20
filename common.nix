{ config, pkgs, ... }:

{
  imports = [
    ./HomeManagerModules/tmux.nix
    ./HomeManagerModules/zsh.nix
    ./HomeManagerModules/starship.nix
    ./HomeManagerModules/nvim
    ./HomeManagerModules/git.nix
  ];
  home = {
    # In theory, username should not be needed? 
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
      rustup
      poetry
      ansible
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
  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    #poetry.enable = true;
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      options = [
        "--cmd j"
      ];
    };
    pyenv.enable = true;
    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  ripgrep.enable = true;
  };
  fonts.fontconfig.enable = true;
}
