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

    # Tools
    ffmpeg
    zip
    unrar
    unzip
    bat

    # Work
    jetbrains.webstorm
    android-studio
    neovim
    vscode
    rustup

    # Apps
    spotify

    # Bins
    brave

    # Communication
    discord-canary
    tdesktop
  ];
}
