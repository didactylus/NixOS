{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.fonts;
in

{
  options.nyx.fonts = {
    enable = lib.mkEnableOption "enable main fonts";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        liberation_ttf
        corefonts
        unifont
        jetbrains-mono
        nerd-fonts.jetbrains-mono
      ];
    })

  ];
}
