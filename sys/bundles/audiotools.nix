{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    lrcget
    beets
    chromaprint
    yt-dlp
  ];
}
