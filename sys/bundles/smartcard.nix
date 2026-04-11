{ config, pkgs, ... }: {
  services.pcscd.enable = true;
  environment.systemPackages = with pkgs; [
    ccid
    pcsc-tools
  ];
}
