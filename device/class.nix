{ config, lib, pkg, ... }:

let
  cfg = config.nyx.device;
in

{
  options = nyx.device = {
    laptop.enable = mkEnableOption "enable laptop profile";
    server.enable = mkEnableOption "enable server profile";
    console.enable = mkEnableOption "enable gaming console like profile";
  };


}
