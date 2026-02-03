{
    description = "Default Config";

    inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

	disko.url = "github:nix-community/disko";
	disko.inputs.nixpkgs.follows = "nixpkgs";
	
	home-manager = {
	url = "github:nix-community/home-manager/release-25.11";
	inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, nixpkgs, home-manager, disko, ... }: { nixosConfigurations.Keystone = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [
	    ./hosts/Keystone/default.nix
	    disko.nixosModules.disko
	    home-manager.nixosModules.home-manager
	    {
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	    }
	];
    };
  };
}
