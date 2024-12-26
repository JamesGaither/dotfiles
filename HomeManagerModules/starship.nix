{ pkgs, ...}:

{
  xdg.configFile."starship.toml".source = ../configs/starship.toml;
  programs.starship = {
    enable = true;
  };
}
