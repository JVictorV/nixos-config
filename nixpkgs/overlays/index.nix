self: super: {
  discord-canary = super.discord-canary.overrideAttrs (oldAttrs: {
    src = builtins.fetchTarball
      "https://discord.com/api/download/canary?platform=linux&format=tar.gz";
  });
  neofetch = super.neofetch.overrideAttrs (oldAttrs: {
    src = builtins.fetchTarball
      "https://github.com/dylanaraps/neofetch/archive/master.tar.gz";
  });
  jetbrains = super.jetbrains // {
    webstorm = super.jetbrains.webstorm.overrideAttrs (oldAttrs: {
      src = self.fetchzip {
        url = "https://download.jetbrains.com/webstorm/WebStorm-2022.1.tar.gz";
        sha256 = "1wyjc6hb8k4ynlm147bs2wha0q9jhwm2a7v7az5cygxyyyr9rd10";
      };
    });
  };
}
