{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  mpd
  mpc
  rmpc
  lrcget
  beets
  chromaprint
  ]
}
