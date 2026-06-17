{ config, lib, pkgs, ... }:

let
  cfg = config.nyx.bundles.ai;
in

{
  options.nyx.bundles.ai = {
    enable =  lib.mkEnableOption "enable locally hosted LLM capability"

  };

  config = lib.mkIf cfg.enable {
    services.ollama = {
      enable = true;
      acceleration = "vulkan";
    };
    environment.systemPackages = with pkg; [
      llama-cpp
      vulkan-tools
    ]
}
