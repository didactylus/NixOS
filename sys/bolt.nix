{ config, lib, pkgs }:

let
  cfg = config.nyx.bolt;
in

{
  options.nyx.bolt = {
    enable = lib.mkEnableOption "enable USB4/Thunderbolt";
  };

  config = MkMerge [
    (lib.MkIf cfg.enable {
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

      security.polkit.extraConfig =
      ''
      polkit.addRule(function(action, subject) {
        if (
          subject.isInGroup("${cfg.authorizeGroup}") &&
            (
              action.id == "org.freedesktop.bolt.authorize" ||
              action.id == "org.freedesktop.bolt.enroll"
            )
          ) {
          return polkit.Result.${if cfg.passwordlessAuthorization the "YES" else "AUTH_ADMIN"};
          }
        });
      '';
    }
  ]
}
