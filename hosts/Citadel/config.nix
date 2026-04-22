{ config, lib, pkgs, ... }:
{
  networking.hostName = "Citadel";

  system.stateVersion = "25.11";

  assertions = [
    { assertion = false; message = "Citadel is a placeholder host config (not ready to deploy yet)."; }
  ];
}
