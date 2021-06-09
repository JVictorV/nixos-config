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
    epiphany

    # Tools
    ffmpeg
    zip
    unrar
    unzip
    bat
    xclip
    docker-compose
    openssl

    # Work
    jetbrains.webstorm
    android-studio
    neovim
    vscode
    rustup
    google-cloud-sdk
    gitkraken

    # Apps
    spotify
    libreoffice
    brave

    # Communication
    discord-canary
    tdesktop
  ];
}
