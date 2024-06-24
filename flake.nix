{
  description = "NixOS and Home Manager Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    stateVersion = "23.11";
    username = "zeeshans";
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#m1pro
    darwinConfigurations = {

      "m1pro" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
	./hosts/m1pro.nix
	home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.users.zeeshans = ./home;
          }
	];
      };

       "m2air" = nix-darwin.lib.darwinSystem {
         system = "aarch64-darwin";
         modules = [
         ./hosts/m2air.nix
	home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.users.zeeshans = ./home;
          }
	];
      };

       "m3pro" = nix-darwin.lib.darwinSystem {
         system = "aarch64-darwin";
         modules = [
         ./hosts/m3pro.nix
	home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.users.zeeshans = ./home;
          }
	];
      };
    };
  };
}
