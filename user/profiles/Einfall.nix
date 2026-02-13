{ lib, config, pkgs, ... }:

let
    cfg = config.einfall;
in
{
    options = {
        einfall.enable = lib.mkEnableOption "enable user module";
	};

    config = lib.mkIf cfg.enable {
        users.users.Einfall = {
	    isNormalUser = true;
	    home = "/home/Einfall";
	    extraGroups = ["wheel" "input" "networkmanager" "video" "render"];
	    shell = pkgs.zsh;
	};
    #home.stateVersion = "25.11";
    };
}
