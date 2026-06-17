{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.bundles.networking;
in

{
  options.nyx.bundles.networking = {
    enable = lib.mkEnableOption "enable networking";
    wifi = lib.mkEnableOption "enable wifi";
    wwan = lib.mkEnableOption "enable wwan";
    bt = lib.mkEnableOption "enable bluetooth";
  };

  config = lib.mkIf cfg.enable {
    networking.networkmanager.enable = true;
    networking.firewall.enable = true;
    services.resolved.enable = true;

    environment.systemPackages = with pkgs; [
      
    ];
  };
}
