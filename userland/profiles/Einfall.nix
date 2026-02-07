{ lib, config, pkg, ... }:

let
    cfg = config.einfall
in
{
    options = {
        einfall.enable = lib.mkEnableOption "enable user module";

	einfall.userName = lib.mkOption {
	    default = "Einfall/";
	    description = "Einfall";
	};
    };

    config = lib.mkIf cfg.enable {
        users.users.${cfg.userName} = {
	    isNormalUser = true;
	    InitalPassword = "Password";
	    shell = pkgs.zsh;
	};
    };
}
