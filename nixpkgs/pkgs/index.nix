{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # System
    nixpkgs-fmt

    # Tools
    ffmpeg

    # Work
    docker
    jetbrains.webstorm
    android-studio
    neovim
    vscode

    # Apps
    spotify

    # Bins
    firefox-devedition-bin

    # Communication
    discord-canary
  ];
}
