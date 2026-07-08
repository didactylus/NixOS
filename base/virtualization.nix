{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.virt;
in

{
  options.nyx.virt= {
    podman.enable = lib.mkEnableOption "enable Podman";
    qemu.enable = lib.mkEnableOption "enable QEMU/Libvirt";
  };

  config = lib.mkMerge [ 

    (lib.mkIf cfg.podman.enable {
      virtualisation.podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };

      environment.systemPackages = with pkgs; [
        podman
        podman-compose
      ];
    })

    (lib.mkIf cfg.qemu.enable {
      virtualisation.libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
        };
      };
      environment.systemPackages = with pkgs; [
        virt-manager
      ];
    })

  ];
}
