{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
  ];
  home = {
    packages = with pkgs; [
      via
      sqlitebrowser
      vlc
    ];
  };
  # As already mentioned
  targets.genericLinux.enable = true;
  xdg.mime.enable = true;

  # The critical missing piece for me
  xdg.systemDirs.data = [ "${config.home.homeDirectory}/.nix-profile/share/applications" ];
}
