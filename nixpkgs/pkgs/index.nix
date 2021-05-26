{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # System
    nixpkgs-fmt
    xorg.xdpyinfo
    neofetch
    gotop
    htop
    feh

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
