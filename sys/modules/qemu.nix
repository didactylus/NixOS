{ lib, config, pkgs, ... }:

let
  cfg = config.nyx.modules.qemu;
in

{
  options.nyx.modules.qemu = {
    qemu.enable = lib.mkEnableOption "enable Qemu";
  };

  config = lib.mkIf cfg.enable {
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
    ]
  };
}
