{ config, pkgs, ... }: {
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    jack.enable = true;
    pulse.enable = true;
  };
  environment.systemPackages = with pkgs; [
  pavucontrol
  alsa-utils
  pulseaudio
  ]
}
