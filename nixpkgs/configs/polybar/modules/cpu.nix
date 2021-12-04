let
  vars = import ../variables.nix;
in
{
  "module/cpu" = {
    type = "internal/cpu";

    interval = "0.5";

    format = {
      text = " <label>";
      foreground = vars.fg;
      background = vars.bg;
      padding = 1;
    };

    label = "CPU %percentage%%";
  };
}
