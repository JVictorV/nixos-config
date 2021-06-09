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
    mkpasswd
    gnupg
    os-prober
    xclip

    # Tools
    ffmpeg
    zip
    unrar
    unzip
    bat
    google-cloud-sdk

    # Work
    jetbrains.webstorm
    android-studio
    neovim
    vscode
    rustup
    libreoffice

    # Apps
    spotify

    # Bins
    brave

    # Communication
    discord-canary
    tdesktop
  ];
}
