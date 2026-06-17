{ lib, config, pkgs, ... }:

let
  cfg = config.nyx.modules.podman;
in

{
  options.nyx.modules.podman = {
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
