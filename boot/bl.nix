{ config, lib, pkg, ... }:

let
  cfg = config.nyx.boot.loader;
in

{
  options.nyx.boot = {
    loader = lib.mkOption {
      type =  lib.types.enum [
        "systemdboot"
        "grub"
      ];
      default = "systemdboot";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (cfg.loader == "systemdboot" {
      boot.loader.systemd-boot.enable = true;
#     boot.loader.timeout = 0;
      boot.loader.efi.canTouchEfiVariables = true;
    })

    (lib.mkIf (cfg.loader == "grub" {
      boot.loader.grub = true;
#     boot.loader.timeout = 0;
      boot.loader.efi.canTouchEfiVariables = true;
    })

  ];
}
