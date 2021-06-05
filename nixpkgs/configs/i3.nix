{ config, pkgs, lib, ... }:

with lib;
let
  startPolybar = pkgs.writeShellScript "startPolybar" ''
    pkill -f polybar

    if type "xrandr"; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload top &
        echo "starting top bar for $m" | systemd-cat &
        MONITOR=$m polybar --reload bottom &
        echo "starting bottom bar for $m" | systemd-cat &
      done
    else
      polybar --reload top &
      polybar --reload bottom &
    fi
  '';
in {
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = rec {
      modifier = "Mod4"; # Windows Key
      bars = [ ];

      window.border = 1;

      gaps = {
        inner = 16;
        outer = 0;
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
          command = "${startPolybar}";
          notification = false;
        }
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ~/background.jpg";
          always = true;
          notification = false;
        }
      ];
    };
  };

  xsession.enable = true;
}
