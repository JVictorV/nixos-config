{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # System
    nixpkgs-fmt
    xorg.xdpyinfo
    neofetch
    gotop
    htop
    i3status-rust

    # Tools
    ffmpeg
    zip
    unrar
    unzip

    # Work
    docker
    jetbrains.webstorm
    android-studio
    neovim
    vscode
    rustup

    # Apps
    spotify

    # Bins
    firefox-devedition-bin

    # Communication
    discord-canary
  ];
}
