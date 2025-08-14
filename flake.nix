{
  description = "Nix Common flake for James's systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-cosmic, ... }@inputs:
    let
      lib = nixpkgs.lib;
      systems = {
      	pi = "aarch64-linux";
        other = "x86_64-linux";
      };
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
            home-manager.users.jgaither = import ./common.nix;
          }
        ]; 
      };
    };

    homeConfigurations = {
      jgaither = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ 
          {
            home.username = "jgaither";
            home.homeDirectory = "/home/jgaither";
          }
          ./common.nix 
          #./users/jgaither.nix
        ];
      };
      thor = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ 
          {
            home.username = "jgaither";
            home.homeDirectory = "/home/jgaither";
          }
          ./common.nix 
          ./hosts/thor.nix
        ];
      };
      oden = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ 
          {
            home.username = "jgaither";
            home.homeDirectory = "/home/jgaither";
          }
          ./common.nix 
          ./hosts/oden.nix
        ];
      };
      pi = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${systems.pi};
        extraSpecialArgs = { inherit inputs; };
        modules = [ 
          {
            home.username = "pi";
            home.homeDirectory = "/home/pi";
          }
          ./common.nix 
        ];
      };
    };
  };
}
