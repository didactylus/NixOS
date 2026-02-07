{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
 #Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 0;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = false;
 
 #Networking
  networking.hostName = "Gehirn"; # Define your hostname.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

 #Time
   time.timeZone = "Asia/Tokyo";

 #Locale
  i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
   };

 #Enable CUPS to print documents.
  services.printing.enable = true;

 #Enable sound.
  services.pipewire = {
   enable = true;
   alsa.enable = true;
   jack.enable = true;
   pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  #Polkit
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };
    security.polkit.enable = true;

  #PAM
  security.pam.services.hyprlock = {};

  #Users 
    users.users.Einfall = {
     isNormalUser = true;
     home = "/home/Einfall";
     extraGroups = [ "wheel" "input" "networkmanager" "video" "render"];
     shell = pkgs.zsh;
    };

     home-manager.users.Einfall = import ../../home/einfall.nix;

  #Services
    services.gvfs.enable = true;
    services.udisks2.enable = true;
    services.openssh.enable = true;
    services.upower.enable = true;

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
    capSysNice = true;
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
     waybar
     wofi
     grim
     slurp
     wl-clipboard
     mangohud

     #Audio
     helvum
     mpd
     rmpc

     #Video
     vlc
     mpv

     #Wireless
     bluez

     #security
     polkit_gnome

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


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # 
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}



