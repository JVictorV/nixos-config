let
  vars = import ../variables.nix;
in
{
  "module/audio" = {
    type = "internal/alsa";

    format = {
      volume = {
        text = "墳 VOL <label-volume>";
        padding = 1;
        foreground = vars.fg;
        background = vars.bg;
      };

      muted = {
        text = "<label-muted>";
        padding = 1;
        foreground = vars.fg;
        background = vars.bg;
        overline = vars.bg;
        prefix = {
          text = "婢 ";
          foreground = vars.red;
        };
      };
    };

    label = {
      volume = "%percentage%%";
      muted = "VOL Muted";
    };
  };
}
