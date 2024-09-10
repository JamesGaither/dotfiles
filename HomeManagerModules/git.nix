{ pkgs, ...}:

{
  
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    userName = "James Gaither";
    userEmail = "jamesgaither@proton.me";

    aliases = {
    };
  };
}
