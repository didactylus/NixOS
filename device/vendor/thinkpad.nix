{ lib, ... }:

{
  options.nyx.device = {
    vendor = lib.mkOption {
      type = lib.types.enum [
        "thinkpad"
        "framework"
        "dell"
      ];
      default = "thinkpad";
      description = "Device vendor.";
    };

    model = lib.mkOption {
      type = lib.types.enum [
        "p14sg5"
        "t14g4"
      ];
      description = "Device model.";
    };
  };
}
