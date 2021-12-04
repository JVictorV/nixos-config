let
  vars = import ../variables.nix;
in
{
  font = [
    "FuraCode Nerd Font:size=12;3"
    "FuraCode Nerd Font:style=Bold:size=12;3"
  ];

  locale = "en_US.UTF-8";
  enable.ipc = true;

  width = "100%";
  height = 20;
  offset.x = "1%";
  fixed.center = true;

  monitor = "\$\{env:MONITOR:\}";

  background = vars.bg;
  foreground = vars.fg;

  radius = 0;
  padding = 0;
}
