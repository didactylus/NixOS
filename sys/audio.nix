{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.audio;
in

{
  options.nyx.audio = {
    enable = lib.mkEnableOption "enable audio utils";
    gui.enable = lib.mkEnableOption "enable audio tools";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        jack.enable = true;
        pulse.enable = true;
      };
      environment.systemPackages = with pkgs; [
        alsa-utils
        playerctl
        pamixer
      ];
    })
    (lib.mkIf (cfg.enable && cfg.gui.enable) {
      environment.systemPackages = with pkgs; [
        pavucontrol
      ];
    })
  ];
}
