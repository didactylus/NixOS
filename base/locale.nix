{ config, lib, ... }: 

let
  cfg = config.nyx.region;
in

{
  options.nyx.region = {
    locale = lib.mkOption {
      type = lib.types.enum [
        "en_US.UTF-8"
        "en_GB.UTF-8"
        "ja_JP.UTF-8"
      ];
      default = "en_US.UTF-8";
    };

    timezone = lib.mkOption {
      type = lib.types.enum [
        "Asia/Tokyo"
        "America/New_York"
        "UTC"
      ];
      default = "Asia/Tokyo";
    };
  };

  config = {
    i18n.defaultLocale = cfg.locale;
    time.timeZone = "cfg.timezone";

    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
    };
  };
}
