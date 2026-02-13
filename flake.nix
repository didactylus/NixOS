{
    description = "Default Config";

    inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
	wrappers.url = "github:Lassulus/wrappers";
	disko.url = "github:nix-community/disko";
	disko.inputs.nixpkgs.follows = "nixpkgs";
	home-manager = {
	url = "github:nix-community/home-manager/release-25.11";
	inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, nixpkgs, wrappers, home-manager, disko, ... }: 
    let
        mkSystem = { hostname, modules }:
	    nixpkgs.lib.nixosSystem {
	    system = "x86_64-linux";
	    modules = [
	        home-manager.nixosModules.home-manager
                ] ++ modules;
	    };
    in
    { nixosConfigurations.Nomad = mkSystem{
	hostname = "Nomad";
	modules = [ ./hosts/Nomad/n1.nix ];
    };
  };
}
