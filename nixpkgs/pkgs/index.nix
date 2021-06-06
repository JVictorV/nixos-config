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

    # Tools
    ffmpeg
    zip
    unrar
    unzip

    # Work
    jetbrains.webstorm
    android-studio
    neovim
    vscode
    rustup
    gh

    # Apps
    spotify

    # Bins
    brave

    # Communication
    discord-canary
  ];
}
