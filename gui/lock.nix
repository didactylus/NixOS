{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.gui;
in

{
  options.nyx.gui = {
    lock = lib.mkOption {
      type = lib.types.enum [
        "none"
        "hyprlock"
      ];
      default = "none";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (cfg.lock == "hyprlock") {
      security.pam.services.hyprlock = {
        enable = true;
        fprintAuth = true;
      };
      environment.systemPackages = with pkgs; [
        hyprlock
      ];
    })
  ];

}
