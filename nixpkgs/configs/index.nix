{ config, pkgs, lib, ... }:

{
  imports = [
    ./alacritty.nix
    ./fish.nix
    ./gh.nix
    ./git.nix
    ./gpg.nix
    ./i3.nix
    ./nix-direnv.nix
    ./picom.nix
    ./polybar
    ./rofi
    ./vscode.nix
  ];
}
