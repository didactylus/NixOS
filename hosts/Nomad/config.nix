{ config, lib, pkgs, ... }:

{
  imports =[
      ./hardware-configuration.nix
      ../../sys/agg.nix
      ../../user/profiles/Einfall.nix
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
  nyx.users.einfall.enable = true;
 #Networking
  networking.hostName = "Nomad";
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

  #Polkit
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
  security.polkit.enable = true;

  #PAM
# security.pam.services.hyprlock = {};
# security.pam.services.sudo.fprintAuth = false;
# security.pam.services.hyprlock.fprintAuth = true;

  #Services
# services.fprintd.enable = true;
# services.pcscd.enable = true;
  services.resolved.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.openssh.enable = true;
  services.upower.enable = true;
  services.printing.enable = true;

  #Programs
  programs.firefox.enable = true;
  programs.hyprland.enable = true;
  programs.tmux.enable = true;
  programs.neovim.enable = true;
  programs.zsh.enable = true;
  programs.steam.enable = true;
  programs.mtr.enable = true;
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

  #Desktop utils
  hyprpaper
  hyprlock
  hyprcursor
  hypridle
  waybar
  wofi
# grim
# slurp
# wl-clipboard
  mangohud
# quickshell

  #Audio
  pulseaudio
# helvum

  #Video
# mpv

  #Gaming
  ryubing
  osu-lazer-bin

  #Docs
  calibre
  onlyoffice-desktopeditors

  #Wireless
  networkmanagerapplet
  blueman
  bluez
  mullvad
  mullvad-vpn

  #Utility
  logiops

  #Security
  polkit_gnome
# fprintd
# ccid
# pcsc-tools
  yubikey-manager

  #file manager
  doublecmd
  xfce.thunar
  xfce.thunar-volman
  xfce.thunar-vcs-plugin

  #Notes
# obsidian

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
  docker
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
