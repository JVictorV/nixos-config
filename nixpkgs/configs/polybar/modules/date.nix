let
  vars = import ../variables.nix;
in

{
  "module/date" = {
    type = "internal/date";

    interval = "1.0";

    time = "%H:%M:%S %d/%m/%y%";

    format = {
      text = "<label>";
      padding = 1;
      foreground = vars.fg;
    };

    label = " %time%";
  };
}
