let
  vars = import ../variables.nix;
in
{
  "module/powermenu" = {
    type = "custom/menu";
    expand.right = true;

    format = {
      text = "<label-toggle> <menu>";
      background = vars.bg;
      padding = 1;
    };

    label = {
      open = "";
      close = "";
      separator = "  ";
    };

    menu = [
      [
        { text = " Suspend"; exec = "suspend"; }
        { text = " Reboot"; exec = "reboot"; }
        { text = " Shutdown"; exec = "poweroff"; }
      ]
    ];
  };
}
