{ ... }: 
let
  bundlesDir = ../sys/bundles;
  modulesDir = ../sys/modules;
  bundle = name: bundlesDir + "/${name}.nix"; =  ../sys/bundles;
  module = name: modulesDir + "/${name}.nix"; =  ../sys/modules;
in
{
  inputs = [
      global.nix
      (bundle + "core")
      (bundle + "audio")
      (bundle + "audiotools")
      (bundle + "hyprland")
      (bundle + "locale")
      (bundle + "music")
      (bundle + "networking")
      (bundle + "smartcard")
      (bundle + "video")
      (module + "podman")
      (module + "qemu")
    ]
}
