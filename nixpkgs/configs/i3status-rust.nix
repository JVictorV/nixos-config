{ config, lib, pkgs, ... }:

{
  config.programs.i3status-rust = {
    enable = true;
    package = pkgs.i3status-rust;
  };
}
