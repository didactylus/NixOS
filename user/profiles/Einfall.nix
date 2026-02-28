{ lib, config, pkgs, ... }:

let
  cfg = config.einfall;
in

{
  options = {
    einfall.enable = lib.mkEnableOption "enable Einfall user";
  };

  config = lib.mkIf cfg.enable {
    # NixOS user creation
    users.users.Einfall = {
      isNormalUser = true;
      home = "/home/Einfall";
      extraGroups = [ "wheel" "input" "networkmanager" "video" "render" ];
      shell = pkgs.zsh;
    };

    # Home-manager config for Einfall
    home-manager.users.Einfall = {
      home.username = "Einfall";
      home.homeDirectory = "/home/Einfall";
      home.stateVersion = "25.11";

      # Programs
      programs.zsh = {
        enable = true;
        initExtra = ''
          export EDITOR=nvim
          export PATH="$HOME/.local/bin:$PATH"
        '';
      };

      programs.neovim = {
        enable = true;
        defaultEditor = true;
      };

      programs.git = {
        enable = true;
        userName = "didactylus";
        userEmail = "brianbraden@proton.me";
        extraConfig = {
          init.defaultBranch = "main";
          pull.rebase = true;
        };
      };

      programs.ssh = {
        enable = true;
        matchBlocks."github.com" = {
          hostname = "github.com";
          user = "didactylus";
          identityFile = "~/.ssh/gitssh.pub.key";
        };
      };

      # Dotfiles
      home.file.".config/nvim/init.lua" = {
        source = ../../user/dotfiles/Einfall/init.lua;
      };

      home.file.".config/waybar/config" = {
        source = ../../user/dotfiles/Einfall/config.jsonc;
      };

      home.file.".config/hyprland/hyprland.conf" = {
        source = ../../user/dotfiles/Einfall/hyprland.config;
      };

      home.file.".zshrc" = {
        source = ../../user/dotfiles/Einfall/.zshrc;
      };

      home.createDirectories = true;
    };
  };
}
