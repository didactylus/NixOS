{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.core;
in

{
  options.nyx.core = {
    enable = lib.mkEnableOption "enable core applications";
  };

  config = lib.mkIf cfg.enable {

    programs = {
    neovim.enable = true;
    tmux.enable = true;
    zsh.enable = true;
    };
    environment.systemPackages = with pkgs; [
      usbutils
      bat
      fd
      fzf
      jq
      ripgrep
      tree
      dust
      btop
      htop
      iotop
      curl
      rsync
      unzip
      zip
      p7zip
      cloc
      ffmpeg
      wget
      browsh
      git
      strace
      fastfetch
      grim 
      slurp
      wl-clipboard
    ];
  };
}
