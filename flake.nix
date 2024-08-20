{
  description = "Nix Common flake for James's systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-cosmic }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      specialArgs = inputs;
      #shared-modules = [
      #  home-manager.nixosModules.home-manager
      #  {  
      #     home-manager = {
      #     useUserPackages = true;
      #      extraSpecialArgs = specialArgs;
      #    };
      #  }
      #];
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos1 = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./hosts/nix1.nix 
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jgaither = import ./server.nix;
          }
        ]; 

      };
      thor = lib.nixosSystem {
        inherit system;
        modules = [ 
          {
            nix.settings = {
              substituters = [ "https://cosmic.cachix.org/" ];
              trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
           };
          }
          nixos-cosmic.nixosModules.default
          ./hosts/thor/configuration.nix 
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jgaither = import ./hosts/thor/home.nix;
          }
        ]; 

      };
    };

    homeConfigurations = {
      jgaither = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          ./common.nix 
          #./users/jgaither.nix
        ];
      };
    };
    };
}
