{ config, lib, ... }: 

let
  cfg = config.nyx.locale;
in

{
  options.nyx.locale = {
    jpen.enable = lib.mkEnableOption "set locale";
  };

  config = lib.mkIf cfg.jpen.enable {
    time.timeZone = "Asia/Tokyo";
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
    };
  };
}
