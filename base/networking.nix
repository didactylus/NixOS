{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.networking;
in

{
  options.nyx.networking = {
    enable = lib.mkEnableOption "enable networking";
    bluetooth.enable = lib.mkEnableOption "enable bluetooth"


  };

  config = lib.mkMerge [

    (lib.mkIf cfg.enable {
      networking.networkmanager.enable = true;
      networking.firewall.enable = true;
      services.resolved.enable = true;
      programs.mtr.enable = true;

    })

    (lib.mkIf cfg.bluetooth.enable {
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings.General.Exerimental = true;
      };

      services.blueman.enable = true;

      environment.systemPackages = with pkgs; [
        bluez
        bluez-tools
      ];
    })

  ];
}
