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

  primaryMonitor = "DisplayPort-2";
  secondaryMonitor = "HDMI-A-0";
in
{
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

      focus.followMouse = false;

      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+space" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
        "${modifier}+y" = "exec ${pkgs.escrotum}/bin/escrotum -s -C";
      };

      startup = [
        {
          command = "xrandr --output ${primaryMonitor} --primary --mode 3440x1440 --rate 144.00 --output ${secondaryMonitor} --mode 2560x1080 --rate 74.99 --left-of ${primaryMonitor}";
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
        {
          # Fix for my weird keyboard layout
          command = "setxkbmap -option altwin:swap_alt_win";
          always = true;
          notification = false;
        }
      ];
    };

    # TODO Remove once new workspaceOutputStr is merged
    extraConfig = ''
      workspace 1 output ${secondaryMonitor}
      workspace 3 output ${secondaryMonitor}
      workspace 5 output ${secondaryMonitor}
      workspace 7 output ${secondaryMonitor}
      workspace 9 output ${secondaryMonitor}

      workspace 2 output ${primaryMonitor}
      workspace 4 output ${primaryMonitor}
      workspace 6 output ${primaryMonitor}
      workspace 8 output ${primaryMonitor}
      workspace 10 output ${primaryMonitor}
    '';
  };

  xsession.enable = true;
}
