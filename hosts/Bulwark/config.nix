{ config, lib, pkgs, ... }:
{
  networking.hostName = "Bulwark";

  system.stateVersion = "25.11";

  assertions = [
    { assertion = false; message = "Bulwark is a placeholder host config (not ready to deploy yet)."; }
  ];
}
