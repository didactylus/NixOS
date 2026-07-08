{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.core;
in

{

  options.nyx.core = {
    enable = lib.mkEnableOption "enable core applications";
    diagnostic.enable = lib.mkEnableOption "enable core diagnostic utilities";
    misc.enable = lib.mkEnableOption "enable misc utilities";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {

      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = [ "nix-command" "flakes" ];

      programs = {
        neovim.enable = true;
        tmux.enable = true;
        zsh.enable = true;
      };

      environment.systemPackages = with pkgs; [
        curl
        wget
        git
        rsync
        file
        zip
        unzip
        p7zip
        bat
        fd
        fzf
        jq
        ripgrep
        tree
        dust
        eza
        zoxide
        usbutils
        strace
        fastfetch
        lsof
        cloc
      ];
    })

    (lib.mkIf cfg.diagnostic.enable {
      environment.systemPackages = with pkgs; [
        btop
        htop
        iotop
      ];
    })

    (lib.mkIf cfg.misc.enable {
      environment.systemPackages = with pkgs; [
        browsh
      ];
    })
  ];
}
