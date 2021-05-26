{ config, pkgs, lib, ... }:

{
  imports = [
    ./alacritty.nix
    ./i3.nix
    ./rofi.nix
    ./polybar.nix
  ];
}
