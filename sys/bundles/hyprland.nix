{ config, pkgs, ... }:

{
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
  
  environment.sysetemPackages = with pkgs [
  networkmanagerapplet
  ];
}
