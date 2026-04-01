{ config, lib, pkgs, ... }:

{
  imports =[
      ./hardware-configuration.nix
      ../../user/profiles/Einfall.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

 #Networking
  networking.hostName = "Nomad";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

 #Time
  time.timeZone = "Asia/Tokyo";

 #Locale
  i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
#   useXkbConfig = true; # use xkb.options in tty.
  };

  #Enable touchpad support (enabled default in most desktopManager).
# services.libinput.enable = true;

  #Polkit
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
  security.polkit.enable = true;

  #PAM
  security.pam.services.hyprlock = {};
  security.pam.services.sudo.fprintAuth = false;
  security.pam.services.hyprlock.fprintAuth = true;

  #Users 
  einfall.enable = true;

  #Services
  services.fprintd.enable = true;
  services.pcscd.enable = true;
  services.resolved.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.openssh.enable = true;
  services.upower.enable = true;
  services.printing.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    jack.enable = true;
    pulse.enable = true;
  };

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
  #Virtualization
  virtualisation.libvirtd = {
  enable = true;
  qemu = {
    package = pkgs.qemu_kvm;
    runAsRoot = true;
    swtpm.enable = true;
  };
};
  #Enable Dockerd
  virtualisation.docker.enable = true;

  #Packages
  environment.systemPackages = with pkgs; [

  #Desktop utils
  hyprpaper
  hyprlock
  hyprcursor
  waybar
  wofi
  grim
  slurp
  wl-clipboard
  mangohud
  quickshell

  #Audio
  pavucontrol
  alsa-utils
  pulseaudio
  helvum
  mpd
  mpc
  rmpc

  #Video
  vlc
  mpv

  #Gaming
  ryubing

  #Docs
  calibre
  onlyoffice-desktopeditors

  #Wireless
  networkmanagerapplet
  bluez

  #Utility
  logiops

  #Security
  polkit_gnome
  fprintd
  ccid
  pcsc-tools
  yubikey-manager

  #file manager
  xfce.thunar
  xfce.thunar-volman
  xfce.thunar-vcs-plugin

  #Notes
  obsidian

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
  git
  virt-manager
  docker

  #shell utils
  usbutils
  yt-dlp
  bat
  fd
  ripgrep
  fzf
  jq
  tree
  dust
  btop
  htop
  iotop
  strace
  curl
  rsync
  unzip
  zip
  p7zip
  cloc
  traceroute
  fastfetch
  less
  ffmpeg
  ghostty
  wget
  neofetch
  browsh

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
