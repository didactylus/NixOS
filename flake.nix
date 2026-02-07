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

    in
    { nixosConfigurations.Keystone = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [
	    ./hosts/Keystone/default.nix
	];
	
    { nixosConfigurations.Atlas= nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [
	    ./hosts/Atlas/default.nix
	];

    { nixosConfigurations.BigIron = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [
	    ./hosts/BigIron/default.nix
	];
    };
  };
}
