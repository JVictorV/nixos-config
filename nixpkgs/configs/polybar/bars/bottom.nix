let
  defaultBar = import ./defaultBar.nix;
in
{
  "bar/bottom" = {
    bottom = true;

    tray = {
      position = "left";
      detached = false;
      padding = 5;
      scale = 1;

      offset = {
        x = "-1%";
      };
    };

    scroll = {
      up = "i3wm-wsprev";
      down = "i3wm-wsnext";
    };

    modules = {
      left = "i3";
      right = "audio date";
    };
  } // defaultBar;
}
