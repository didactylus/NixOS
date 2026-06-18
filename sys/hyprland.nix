{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.hyprland;
in

{
  options.nyx.hyprland = {
    enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf cfg.enable {
    security.polkit.enable = true;
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };

    security.pam.services.hyprlock = {
    enable = true;
    fprintAuth = true;
    };

    programs.hyprland.enable = true;
  
    environment.systemPackages = with pkgs; [
      hyprpaper
      hyprlock
      hypridle
      hyprcursor
    ];
  };
}
