{ config, pkgs, lib, ... }:

{
  imports = [
    ./alacritty.nix
    ./fish.nix
    ./gh.nix
    ./git.nix
    ./gpg.nix
    ./i3.nix
    ./picom.nix
    ./polybar.nix
    ./rofi.nix
    ./vscode.nix
  ];
}
