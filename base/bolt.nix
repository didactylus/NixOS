{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.bolt;
in
{
  options.nyx.bolt = {
    enable = lib.mkEnableOption "enable USB4/Thunderbolt";

    authorizeGroup = lib.mkOption {
      type = lib.types.str;
      default = "wheel";
    };

    passwordlessAuthorization = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      security.polkit.enable = true;
      services.hardware.bolt.enable = true;

      boot.kernelModules = [
        "thunderbolt"
        "typec"
        "ucsi_acpi"
      ];

      environment.systemPackages = with pkgs; [
        bolt
      ];

      security.polkit.extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (
            subject.isInGroup("${cfg.authorizeGroup}") &&
            (
              action.id == "org.freedesktop.bolt.authorize" ||
              action.id == "org.freedesktop.bolt.enroll"
            )
          ) {
            return polkit.Result.${if cfg.passwordlessAuthorization then "YES" else "AUTH_ADMIN"};
          }
        });
      '';
    })
  ];
}
