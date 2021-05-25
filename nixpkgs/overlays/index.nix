self: super: {
  discord-canary = super.discord-canary.overrideAttrs (_: {
    src = builtins.fetchTarball
      "https://discord.com/api/download/canary?platform=linux&format=tar.gz";
  });
  neofetch = super.neofetch.overrideAttrs (oldAttrs: {
    src = builtins.fetchTarball
      "https://github.com/dylanaraps/neofetch/archive/master.tar.gz";
  });
}
