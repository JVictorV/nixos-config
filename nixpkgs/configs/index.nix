{ config, pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./gpg.nix
    ./alacritty.nix
    ./i3.nix
    ./rofi.nix
    ./polybar.nix
  ];
}
