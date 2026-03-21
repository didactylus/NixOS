{ lib, config, pkgs, self,... }:

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
      extraGroups = [ "libvirtd" "wheel" "input" "networkmanager" "video" "render" ];
      shell = pkgs.zsh;
    };

    # Home-manager config for Einfall
    home-manager.users.Einfall = {
      home.username = "Einfall";
      home.homeDirectory = "/home/Einfall";
      home.stateVersion = "25.11";

      # Programs
      programs.zsh.enable = false;
      home.packages = [ pkgs.zsh ];

      programs.neovim = {
        enable = true;
        defaultEditor = true;
      };

      programs.git = {
        enable = true;
        settings = {
          user.name = "didactylus";
          user.email = "brianbraden@proton.me";
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
      home.file.".zshrc".source = "${self}/user/dotfiles/Einfall/.zshrc";
      home.file.".config/nvim/init.lua".source = "${self}/user/dotfiles/Einfall/init.lua";
      home.file.".config/waybar/config".source = "${self}/user/dotfiles/Einfall/config.jsonc";
      home.file.".config/hypr/hyprland.conf".source = "${self}/user/dotfiles/Einfall/hyprland.conf";
      home.file.".config/hypr/hyprlock.conf".source = "${self}/user/dotfiles/Einfall/hyprlock.conf";
      home.file.".config/hypr/hypridle.conf".source = "${self}/user/dotfiles/Einfall/hypridle.conf";
      home.file.".config/hypr/hyprpaper.conf".source = "${self}/user/dotfiles/Einfall/hyprpaper.conf";
     #home.file.".config/quickshell/shell.qml".source = "${self}/user/dotfiles/Einfall/shell.qml";
    };
  };
}
