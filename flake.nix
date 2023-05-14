{
  description = "Home Manager configuration of jgaither";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #dotfiles = {
    #  url = "github:jamesgaither/dotfiles";
    #  flake = false;
    #};
  };

  outputs = { nixpkgs, home-manager, ... }: # dotfiles,
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations = {
       "desktop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
            ./desktop.nix
          ];
        };

      };
    };
}
