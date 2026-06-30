{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.podman;
in

{
  options.nyx.podman = {
    enable = lib.mkEnableOption "enable Podman";
    dockerCompat = lib.mkEnableOption "Docker CLI compatibility (podman-docker)";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.podman = {
      enable = true;
      dockerCompat = cfg.dockerCompat;
      defaultNetwork.settings.dns_enabled = true;
    };

    environment.systemPackages = with pkgs; [
      podman
      podman-compose
    ];
  };
}
