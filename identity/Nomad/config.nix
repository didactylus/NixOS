{ config, lib, pkgs, ... }:

{
  imports =[
      ./hardware-configuration.nix
      ../../agg.nix
  ];

 #Boot
  boot.loader.systemd-boot.enable = true;
# boot.loader.timeout = 0;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = false;

  #Swap
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 96 * 1024;
    }
  ];

 #Locale
  nyx.locale.jpen.enable = true;

 #Hostname
  networking.hostName = "Nomad";

 #Firewall
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

 #Users
  nyx.users.einfall.enable = true;

 #Bundles
  nyx.audio = {
    enable = true;
    gui.enable = true;
  };

  nyx.core.enable = true;
  nyx.ai.ik_llama.enable = true;
  nyx.hyprland.enable = true;
  nyx.networking.enable = true;
  nyx.media.music = {
    enable = true;
    tools.enable = true;
  };
  nyx.media.video = { 
    enable = true;
    tools.enable = true;
  };
  nyx.virt.podman.enable = true;
  nyx.virt.qemu.enable = true;
  nyx.bolt.enable = true;

 #Services
# services.pcscd.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.openssh.enable = true;
  services.upower.enable = true;
  services.printing.enable = true;

  #Programs
  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

 #Packages
  environment.systemPackages = with pkgs; [
# ryubing
# osu-lazer-bin

# #Wireless
  mullvad
  mullvad-vpn

# #Utility
# logiops

# #Theming
# pywal
# #privacy
# i2pd
# i2pd-tools
# tor

# #entertainment
# prismlauncher
  ];

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "25.05"; # Did you read the comment?
}
