{ config, pkgs, ... }:

{
  imports = [
    ../../common.nix
    ../../HomeManagerModules/firefox.nix
  ];
  home = {
    packages = with pkgs; [
      via
      sqlitebrowser
      vlc
      libreoffice-qt
    ];
  };
  # As already mentioned
  targets.genericLinux.enable = true;
  xdg.mime.enable = true;

  # The critical missing piece for me
  #xdg.systemDirs.data = [ "${config.home.homeDirectory}/.nix-profile/share/applications" ];
}
