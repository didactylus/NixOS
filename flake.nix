{
    description = "Default Config";

    inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  ik_llama.url = "path:/com/ik_llama.cpp-main";
	disko.url = "github:nix-community/disko";
	disko.inputs.nixpkgs.follows = "nixpkgs";
	home-manager = {
	url = "github:nix-community/home-manager/release-25.11";
	inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = inputs@{ self, nixpkgs, home-manager, disko, ik_llama, ... }:
    let
        mkSystem = { hostname, modules }:
	    nixpkgs.lib.nixosSystem {
	    system = "x86_64-linux";
	    specialArgs = { inherit self inputs; };
	    modules = [
	   #disko.nixosModules.disko
           #./sys/modules/disk/btrfs.nix
	   #{
	   # _module.args.disks = [ "/dev/nvme0" ];
	   #}
	  home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { inherit self inputs; };
    }
              ] ++ modules;
	    };
    in
    {
    nixosConfigurations.Nomad = mkSystem{
      hostname = "Nomad";
      modules = [ ./hosts/Nomad/config.nix ];
    };

    nixosConfigurations.Citadel = mkSystem{
      hostname = "Citadel";
      modules = [ ./hosts/Citadel/config.nix ];
    };

    nixosConfigurations.Bulwark = mkSystem{
      hostname = "Bulwark";
      modules = [ ./hosts/Bulwark/config.nix ];
    };
    nixosConfigurations.Sentinel = mkSystem{
      hostname = "Sentinel";
      modules = [ ./hosts/Sentinel/config.nix ];
    };
  };
}
