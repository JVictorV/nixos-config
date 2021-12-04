let
  vars = import ../variables.nix;
in
{
  "module/title" = {
    type = "internal/xwindow";
    format = "<label>";
    label = {
      text = "%title%";
      maxlen = 140;
    };
  };
}
