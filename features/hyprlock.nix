{ config, pkgs, j
in
{
  security.pam.services.hyprlock = {
  enable = true;
  fprintAuth = true;
  };
  environment.systemPackages = with pkgs; [
    hyprlock
  ];
}
