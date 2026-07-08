{ config, lib, pkgs, ... }:
{
  networking.hostName = "Sentinel";

  system.stateVersion = "25.11";

  assertions = [
    { assertion = false; message = "Sentinel is a placeholder host config (not ready to deploy yet)."; }
  ];
}
