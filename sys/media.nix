{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.media;
in

{
  options.nyx.media = {
    music.enable = lib.mkEnableOption "enable music";
    music.tools.enable = lib.mkEnableOption "enable music tools";

    video.enable = lib.mkEnableOption "enable video";
    video.tools.enable = lib.mkEnableOption "enable video tools";
  };

  config = lib.mkMerge [

    (lib.mkIf cfg.music.enable {
      environment.systemPackages = with pkgs; [
        mpd
        rmpc
      ];
    })

    (lib.mkIf cfg.music.tools.enable {
      environment.systemPackages = with pkgs; [
        lrcget
        #beets
        chromaprint
        yt-dlp
        wrtag
      ];
    })

    (lib.mkIf cfg.video.enable {
      environment.systemPackages = with pkgs; [
        mpv
      ];
    })

    (lib.mkIf cfg.video.tools.enable {
      environment.systemPackages = with pkgs; [
        ffmpeg
      ];
    })

  ];
}
