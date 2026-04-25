{ ... }: 
let
  bundlesDir = ../sys/bundles;
  modulesDir = ../sys/modules;
  bundle = name: bundlesDir + "/${name}.nix";
  module = name: modulesDir + "/${name}.nix";
in
{
  imports = [
      ./global.nix
      (bundle "audio")
      (bundle "audiotools")
      (bundle "core")
      (bundle "hyprland")
      (bundle "locale")
      (bundle "music")
      (bundle "networking")
      (bundle "smartcard")
      (bundle "video")
      (bundle "virtualization")
      (module "fprint")
      (module "hyprlock")
      (module "mullvad")
      (module "podman")
      (module "qemu")
    ];
}
