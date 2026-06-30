{ ... }: 
let
  sysDir = ./sys;
  userDir = ./user/profiles;
  sys = name: sysDir + "/${name}.nix";
  usr = name: userDir + "/${name}.nix";
in
{
  imports = [
      (sys "global")
      (sys "audio")
      (sys "core")
      (sys "hyprland")
      (sys "locale")
      (sys "networking")
      (sys "media")
      (sys "virtualization")
      (sys "misc")
      (sys "ai")
      (sys "bolt")
      (usr "Einfall")
    ];
}
