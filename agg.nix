{ ... }: 
let
  baseDir = ./base; 
  bootDir = ./boot;
  devDir = ./device;
  guiDir = ./gui;
  idDir = ./identity;
  userDir = ./user/profiles;
  featDir = ./features;

  base = name: baseDir + "/${name}.nix";
  boot = name: bootDir + "/${name}.nix";
  dev = name: devDir + "/${name}.nix";
  gui = name: guiDir + "/${name}.nix";
  usr = name: userDir + "/${name}.nix";
  feat = name: featDir + "/${name}.nix";

in
{
  imports = [
      (base "audio")
      (base "auth")
      (base "bolt")
      (base "core")
      (base "locale")
      (base "networking")
      (base "media")
      (base "virtualization")
      (boot "bl")
      (boot "btrfs")
      (boot "ext4")
      (boot "zfs")
      (gui "de")
      (gui "wm")
      (gui "lock")
      (feat "ai")
      (usr "Einfall")
    ];
}
