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
    jdk

    # Tools
    ffmpeg
    zip
    unrar
    unzip
    bat
    xclip
    docker-compose
    openssl
    youtube-dl
    droidcam
    v4l-utils
    any-nix-shell
    escrotum
    
    # Work
    jetbrains.webstorm
    android-studio
    neovim
    vscode
    rustup
    google-cloud-sdk
    gitkraken
    nodePackages.node2nix
    emacs

    # Apps
    libreoffice
    brave
    google-chrome
    firefox-devedition-bin
    obs-studio
    multimc

    # Communication
    discord-canary
    tdesktop
  ];
}
