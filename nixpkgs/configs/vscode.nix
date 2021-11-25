{ config, pkgs, lib, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = [
      pkgs.vscode-extensions.ms-vsliveshare.vsliveshare
    ];
  };
}
