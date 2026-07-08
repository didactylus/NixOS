{ ... }: 
let
  baseDir = ./base;
  bootDir = ./boot;
  devDir = ./device;
  guiDir = ./gui;
  idDir = ./identity;
  userDir = ./user/profiles;

  base = name: baseDir + "/${name}.nix";
  boot = name: bootDir + "/${name}.nix";
  dev = name: devDir + "/${name}.nix";
  gui = name: guiDir + "/${name}.nix";
  usr = name: userDir + "/${name}.nix";

in
{
  imports = [
      (base "audio")
      (base "auth")
      (base "bolt")
      (base "core")
      (base "diagnostic")
      (base "locale")
      (base "networking")
      (base "media")
      (base "virtualization")
      (boot "btrfs")
      (boot "ext4")
      (boot "zfs")
      (gui "de")
      (gui "wm")
      (usr "Einfall")
    ];
}
