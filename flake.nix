{
  description = "Nix Common flake for James's systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos1 = lib.nixosSystem {
        inherit system;
        modules = [ ./nixos/nix1.nix ];
      };
    };

    homeConfigurations = {
      jgaither = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./server.nix ];
      };
    };
    };
}
