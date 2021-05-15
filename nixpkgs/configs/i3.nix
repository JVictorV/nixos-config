{ pkgs, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = rec {
      modifier = "Mod4"; # Windows Key

      window.border = 0;

      gaps = {
        inner = 16;
        outer = 4;
      };

      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+space" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
      };

      startup = [
        {
          command = "xrandr --output HDMI-0 --left-of DP-0";
          always = true;
          notification = false;
        }
        {
          command = "systemctl --user restart polybar.service";
          always = true;
          notification = false;
        }
      ];
    };
  };

  xsession.enable = true;
}
