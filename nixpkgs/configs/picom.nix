{ config, pkgs, lib, ... }:

{
  services.picom = {
    enable = true;
    activeOpacity = "1.0";
    inactiveOpacity = "0.8";
    backend = "glx";
    fade = true;
    fadeDelta = 5;
    opacityRule = [
      "100:name *= 'i3lock'"
      "100:fullscreen"
      "100:class_g = 'Alacritty' && focused"
      "70:class_g = 'Alacritty' && !focused"
      "100:class_g *?= 'Rofi'"
      "100:class_g = 'Brave-browser' && focused"
      "100:class_g = 'Brave-browser' && !focused"
      "100:name *= 'Guvcview'"
    ];

    shadow = true;
    shadowOpacity = "0.75";
    extraOptions = ''
      xrender-sync-fence = true;
      mark-ovredir-focused = false;
      use-ewmh-active-win = true;
    '';
  };
}
