{ config, lib, pkgs, ... }:
let
  cfg = config.nyx.auth.fprint;
in
{
  options.nyx.auth.fprint = {
    enable = lib.mkEnableOption "Fingerprint auth support";
    sudo = lib.mkEnableOption "Allow fingerprint for sudo";
    hyprlock = lib.mkEnableOption "Allow fingerprint for hyprlock";
    polkit = lib.mkEnableOption "Allow fingerprint for polkit";
    login = lib.mkEnableOption "Allow fingerprint for TTY login";
  };

    config = lib.mkIf cfg.enable {
      services.fprintd.enable = true;

      security.pam.services.sudo.fprintAuth = cfg.sudo;
      security.pam.services.hyprlock.fprintAuth = cfg.hyprlock;
      security.pam.services.polkit-1.fprintAuth = cfg.polkit;
      security.pam.services.login.fprintAuth = cfg.login;

      environment.systemPackages = with pkgs; [
        fprintd
      ];
    assertions = [
      {
        assertion = (!cfg.hyprlock) || (config.programs.hyprlock.enable or false);
        message = "nyx.auth.fprint.hyprlock is enabled but programs.hyprlock.enable is not.";
      }
    ];
  };
}
