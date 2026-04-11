{ config, pkgs, ... }: {
  
  programs = {
  neovim.enable = true;
  tmux.enable = true;
  zsh.enable = true;
  noctalia.enable = true;
  };
  environment.systemPackages = with pkgs; [
    mpv
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

}
