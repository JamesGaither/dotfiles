{ pkgs, ...}:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jgaither = {
    isNormalUser = true;
    description = "jgaither";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
