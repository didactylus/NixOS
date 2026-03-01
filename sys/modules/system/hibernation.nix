{ config, lib, ... }:
{
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 96 * 1024;
    }
  ];

  powerManagement.enable = true;
}
