let
  vars = import ../variables.nix;
in
{
  "module/memory" = {
    type = "internal/memory";

    interval = 3;

    format = {
      text = " <label>";
      background = vars.bg;
      foreground = vars.fg;
      padding = 1;
    };

    label = "RAM %percentage_used%%";
  };

}
