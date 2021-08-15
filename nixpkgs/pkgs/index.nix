{ pkgs, environment, ... }:


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
    v4l-utils
    any-nix-shell
    escrotum
    piper
    
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
    guvcview

    # Communication
    discord-canary
    tdesktop
  ];
}
