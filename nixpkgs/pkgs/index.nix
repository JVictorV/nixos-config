{ pkgs, ...}:

{
  home.packages = with pkgs; [
    # Tools
    ffmpeg

    # Work
    docker
    jetbrains.webstorm
    android-studio

    # Bins
    firefox-devedition-bin

    # Communication
    discord-canary
  ];
}
