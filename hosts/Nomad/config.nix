{ config, lib, pkgs, ... }:

{
  imports =[
      ./hardware-configuration.nix
      ../../agg.nix
      ../../user/agg.nix
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

  nyx.ai.ik_llama.enable = true;
  nyx.core.enable = true;
  nyx.hyprland.enable = true;
  nyx.locale.jpen.enable = true;
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

 #Modules

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
  ryubing
  osu-lazer-bin

  #Docs
  calibre
  onlyoffice-desktopeditors

  #Wireless
  mullvad
  mullvad-vpn

  #Utility
  logiops
  #file manager
  doublecmd
  xfce.thunar
  xfce.thunar-volman
  xfce.thunar-vcs-plugin

  #Theming
  pywal
  nordzy-cursor-theme
  font-awesome
  google-fonts
  nerd-fonts.noto
  nerd-fonts.victor-mono
  gtk3
  adwaita-icon-theme
  papirus-icon-theme

  #dev utils
  virt-manager
  #privacy
  i2pd
  i2pd-tools
  tor

  #entertainment
  vencord
  freetube
  prismlauncher
  ];

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "25.05"; # Did you read the comment?
}
