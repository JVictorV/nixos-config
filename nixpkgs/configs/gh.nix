{ pkgs, ... }:

{
  programs.gh = {
    enable = true;
    gitProtocol = "ssh";
  };
}
