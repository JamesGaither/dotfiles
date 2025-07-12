{ config, pkgs, ...}:
{
  programs.zsh.shellAliases = {
    # Double backslash is needed as nix escapes 1
    journal = "nvim ~/Documents/personal_vault/01\\ journal/$(date +%Y%m%d).md";
    hm = "home-manager switch --flake ~/.dotfiles#thor";
  };
}
