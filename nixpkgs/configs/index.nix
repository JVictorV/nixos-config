{ config, pkgs, lib, ... }:

{
  imports = [
    ./alacritty.nix
    ./gh.nix
    ./git.nix
    ./gpg.nix
    ./i3.nix
    ./polybar.nix
    ./rofi.nix
  ];
}
