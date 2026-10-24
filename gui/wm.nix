{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.gui.wm;
in

{
  options.nyx.gui.wm = {
    provider = lib.mkOption {
      type = lib.types.enum [
        "none"
        "hyprland"
        "sway"
        "dwm"
      ];
      default = "none";
    };
  };

  config = lib.mkMerge [

    (lib.mkIf (cfg.provider == "hyprland") {
      security.polkit.enable = true;
      xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
      };
      programs.hyprland.enable = true;
      environment.systemPackages = with pkgs; [
        hyprpaper
        hypridle
        hyprcursor
      ];
    })

    (lib.mkIf cfg.sway.enable {
      
    })

    (lib.mkIf cfg.dwm.enable {
      
    })

  ];
}
