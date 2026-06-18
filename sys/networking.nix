{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.networking;
in

{
  options.nyx.networking = {
    enable = lib.mkEnableOption "enable networking";
  };

  config = lib.mkMerge [

    (lib.mkIf cfg.enable {
      networking.networkmanager.enable = true;
      networking.firewall.enable = true;
      services.resolved.enable = true;
      programs.mtr.enable = true;

    })

  ];
}
