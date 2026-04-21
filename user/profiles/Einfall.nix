{ lib, config, pkgs, self, inputs, ... }:

let
  repo = /home/Einfall/.compute/nixos;
  cfg = config.nyx.users.einfall;
in

{
  options.nyx.users.einfall.enable = lib.mkEnableOption "enable Einfall user";

  config = lib.mkIf cfg.enable {
    users.users.Einfall = {
      isNormalUser = true;
      home = "/home/Einfall";
      extraGroups = [ "libvirtd" "wheel" "input" "networkmanager" "video" "render" ];
      shell = pkgs.zsh;
    };

    home-manager.users.Einfall = {
      home.username = "Einfall";
      home.homeDirectory = "/home/Einfall";
      home.stateVersion = "25.11";
      home.packages = [
#       inputs.noctalia.packages.${pkgs.system}.default
      ];

      programs = {
        neovim = {
          enable = true;
          defaultEditor = true;
        };

        git = {
          enable = true;
          settings = {
            user.name = "didactylus";
            user.email = "brianbraden@proton.me";
            init.defaultBranch = "main";
            pull.rebase = true;
          };
        };

        ssh = {
          enable = true;
	  enableDefaultConfig = false;
          matchBlocks."github.com" = {
            hostname = "github.com";
            user = "didactylus";
            identityFile = "~/.ssh/id_ed25519";
          };
        };
      };

      # Dotfiles
#    home.file.".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${repo}/user/dotfiles/Einfall/.zshrc";
#    home.file.".config/nvim/init.lua".source = config.lib.file.mkOutOfStoresymlink "${repo}/user/dotfiles/Einfall/init.lua";
#    home.file.".config/waybar/config".source = config.lib.file.mkOutOfStoresymlink "${repo}/user/dotfiles/Einfall/config.jsonc";
#    home.file.".config/hypr/hyprland.conf".source = config.lib.file.mkOutOfStoresymlink "${repo}/user/dotfiles/Einfall/hyprland.conf";
#    home.file.".config/hypr/hyprlock.conf".source = config.lib.file.mkOutOfStoresymlink "${repo}/user/dotfiles/Einfall/hyprlock.conf";
#    home.file.".config/hypr/hypridle.conf".source = config.lib.file.mkOutOfStoresymlink "${repo}/user/dotfiles/Einfall/hypridle.conf";
#    home.file.".config/hypr/hyprpaper.conf".source = config.lib.file.mkOutOfStoresymlink "${repo}/user/dotfiles/Einfall/hyprpaper.conf";
#    home.file.".config/quickshell/shell.qml".source = config.lib.file.mkOutOfStoresymlink "${repo}/user/dotfiles/Einfall/shell.qml";
    };
  
    environment.systemPackages = with pkgs; [
      ghostty
      neofetch
      ghostty
      obsidian
      quickshell
      rmpc
      mpd
      ];
  };
}
