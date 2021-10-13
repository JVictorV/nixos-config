self: super: {
  discord-canary = super.discord-canary.overrideAttrs (oldAttrs: {
    src = builtins.fetchTarball
      "https://discord.com/api/download/canary?platform=linux&format=tar.gz";
  });
  neofetch = super.neofetch.overrideAttrs (oldAttrs: {
    src = builtins.fetchTarball
      "https://github.com/dylanaraps/neofetch/archive/master.tar.gz";
  });
  gitkraken = super.gitkraken.overrideAttrs (oldAttrs: {
    src = self.fetchzip {
      url = "https://release.axocdn.com/linux/GitKraken-v8.0.1.tar.gz";
      sha256 = "1n88m41424qwsfp2hy58piqpv2dk6i74hcj184aq6njllvnsznnq";
    };
  });
}
