{ config, lib, pkgs, ... }: 

let
  cfg = config.nyx.bundles.smartcard;
in

{
  options.nyx.bundles.smartcard = {
    enable = lib.mkEnableOption "enable smartcards";
  };

  config = lib.mkIf cfg.enable {

    services.pcscd.enable = true;
    environment.systemPackages = with pkgs; [
      ccid
      pcsc-tools
    ];
  };
}
