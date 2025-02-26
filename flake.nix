{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };		
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ...}:
    let 
    system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;

    config = {
      allowUnfree = true;
    };
  };
  in {
    nixosConfigurations.swhit = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      inherit system;
      modules = [ ./system/configuration.nix ];
    };

    homeConfigurations.swhit = home-manager.lib.homeManagerConfiguration {
#pkgs = nixpkgs.legacyPackages.${system};
      inherit pkgs;
      extraSpecialArgs = {
	inherit nixvim;
      };
      modules = [
	./home/home.nix
      ];
    };
  };
}


