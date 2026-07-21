{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.nyx.ai;
in

{
  options.nyx.ai = {
    ik_llama.enable = lib.mkEnableOption "enables ik_llama.cpp";
  };

  config = lib.mkMerge [

    (lib.mkIf cfg.ik_llama.enable {
      environment.systemPackages = [
        inputs.ik_llama.packages.${pkgs.system}.default
      ];
    })

  ];
}
