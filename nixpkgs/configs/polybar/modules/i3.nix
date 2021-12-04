let
  vars = import ../variables.nix;
in
{
  "module/i3" = {
    type = "internal/i3";

    format = "<label-state> <label-mode>";
    index.sort = true;
    wrapping.scroll = false;

    # Only show workspaces on the same output as the bar
    pin.workspaces = true;

    label = {
      mode = {
        padding = 1;
        foreground = vars.fg;
        background = vars.bg;
      };

      # focused = Active workspace on focused monitor
      focused = {
        text = "%index%";
        background = vars.fg;
        foreground = vars.bg;
        underline = vars.bg;
        padding = 1;
      };

      # unfocused = Inactive workspace on any monitor
      unfocused = {
        text = "%index%";
        padding = 1;
      };

      # visible = Active workspace on unfocused monitor
      visible = {
        text = "%index%";
        background = vars.bg;
        underline = vars.fg;
        padding = 1;
      };

      # urgent = Workspace with urgency hint set
      urgent = {
        text = "%index%";
        background = vars.red;
        padding = 2;
      };
    };
  };
}
