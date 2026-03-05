{ config, lib, ... }:
{
  config.networking.extraHosts = ''
    127.0.0.1 localhost
    ::1 localhost6
  '';
}
