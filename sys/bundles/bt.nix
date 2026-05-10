{ config, lib, pkgs, ... }:
let
  cfg = config.nyx.bundles.bluetooth;
in
{
  options.nyx.bundles.bluetooth = {
    enable = lib.mkEnableOption "Enable Bluetooth";
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooh = {
      enable = true;
      powerOnBoot = true;
      settings.General.Exerimental = true;
    };

    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [
      bluez
      bluez-tools
    ];
  };
}
