{ ... }: 
let
  sysDir = ./sys;
  userDir = ./user;
  sys = name: sysDir + "/${name}.nix";
  user = name: userDir + "/${name}.nix";
in
{
  imports = [
      (sys "global")
      (sys "audio")
      (sys "core")
      (sys "hyprland")
      (sys "locale")
      (sys "networking")
      (sys "virtualization")
    ];
}
