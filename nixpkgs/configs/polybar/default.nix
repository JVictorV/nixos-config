{ pkgs, ... }:

let
  modules = import ./modules;
  bars = import ./bars;

  settings = import ./settings.nix;
  globalWM = import ./global-wm.nix;
in
{
  services.polybar = {
    enable = true;

    package = pkgs.polybar.override {
      i3GapsSupport = true;
      alsaSupport = true;
    };

    script = "polybar -q -r top & polybar -q -r bottom &";

    # I dont know if thats the best way to handle object mergin but well its something ¯\_(ツ)_/¯
    settings =
      settings
      // globalWM
      // modules
      // bars;
  };
}
