{ pkgs, ... }:

let
  bg = "#FAFAFA";
  fg = "#231F20";
  urgency = "#e74c3c";
in
{
  services.polybar = {
    enable = true;

    package = pkgs.polybar.override {
      i3GapsSupport = true;
      alsaSupport = true;
    };

    script = "polybar -q -r top & polybar -q -r bottom &";

    config = {
      "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
      };

      #====================BARS====================#

      "bar/top" = {
        monitor = "\$\{env:MONITOR:\}";
        bottom = false;
        fixed-center = true;

        width = "100%";
        height = 20;
        offset-x = "1%";

        scroll-up = "i3wm-wsnext";
        scroll-down = "i3wm-wsprev";

        background = bg;
        foreground = fg;

        radius = 0;

        font-0 = "FuraCode Nerd Font:size=12;3";
        font-1 = "FuraCode Nerd Font:style=Bold:size=12;3";

        modules-left = "distro-icon powermenu";
        modules-center = "title";
        modules-right = "cpu memory";

        locale = "en_US.UTF-8";
        enable-ipc = true;
      };

      "bar/bottom" = {
        monitor = "\$\{env:MONITOR:\}";
        bottom = true;
        fixed-center = true;

        width = "100%";
        height = 20;

        offset-x = "1%";

        background = bg;
        foreground = fg;

        radius-top = 0;

        tray-position = "left";
        tray-detached = false;
        tray-maxsize = 15;
        tray-offset-x = -20;
        tray-offset-y = 0;
        tray-padding = 5;
        tray-scale = 1;
        padding = 0;

        font-0 = "FuraCode Nerd Font:size=12;3";
        font-1 = "FuraCode Nerd Font:style=Bold:size=12;3";

        modules-left = "i3";
        modules-right = "audio date";

        locale = "en_US.UTF-8";
        enable-ipc = true;
      };

      "settings" = {
        throttle-output = 5;
        throttle-output-for = 10;

        screenchange-reload = true;

        compositing-background = "source";
        compositing-foreground = "over";
        compositing-overline = "over";
        comppositing-underline = "over";
        compositing-border = "over";

        pseudo-transparency = "false";
      };

      #--------------------MODULES--------------------"

      "module/distro-icon" = {
        type = "custom/script";
        exec =
          "${pkgs.coreutils}/bin/uname -r | ${pkgs.coreutils}/bin/cut -d- -f1";
        interval = 999999999;

        format = " <label>";
        format-padding = 1;
        label = "%output%";
        label-font = 1;
      };

      "module/audio" = {
        type = "internal/alsa";

        format-volume = "墳 VOL <label-volume>";
        format-volume-padding = 1;
        format-volume-foreground = fg;
        format-volume-background = bg;
        label-volume = "%percentage%%";

        format-muted = "<label-muted>";
        format-muted-padding = 1;
        format-muted-foreground = fg;
        format-muted-background = bg;
        format-muted-prefix = "婢 ";
        format-muted-prefix-foreground = urgency;
        format-muted-overline = bg;

        label-muted = "VOL Muted";
      };

      "module/cpu" = {
        type = "internal/cpu";

        interval = "0.5";

        format = " <label>";
        format-foreground = fg;
        format-background = bg;
        format-padding = 1;

        label = "CPU %percentage%%";
      };

      "module/date" = {
        type = "internal/date";

        interval = "1.0";

        time = "%H:%M:%S %d/%m/%y%";

        format = "<label>";
        format-padding = 1;
        format-foreground = fg;

        label = " %time%";
      };

      "module/i3" = {
        type = "internal/i3";

        format = "<label-state> <label-mode>";
        index-sort = true;
        wrapping-scroll = false;

        # ; Only show workspaces on the same output as the bar
        pin-workspaces = true;

        label-mode-padding = 1;
        label-mode-foreground = fg;
        label-mode-background = bg;

        # ; focused = Active workspace on focused monitor
        label-focused = "%index%";
        label-focused-background = fg;
        label-focused-foreground = bg;
        label-focused-underline = bg;
        label-focused-padding = 1;

        # ; unfocused = Inactive workspace on any monitor
        label-unfocused = "%index%";
        label-unfocused-padding = 1;

        # ; visible = Active workspace on unfocused monitor
        label-visible = "%index%";
        label-visible-background = bg;
        label-visible-underline = fg;
        label-visible-padding = 1;

        # ; urgent = Workspace with urgency hint set
        # ; label-urgent = !%index%!
        label-urgent = "%index%";
        label-urgent-background = urgency;
        label-urgent-padding = 2;
      };

      "module/title" = {
        type = "internal/xwindow";
        format = "<label>";
        label = "%title%";
        label-maxlen = 70;
      };

      "module/memory" = {
        type = "internal/memory";

        interval = 3;

        format = " <label>";
        format-background = bg;
        format-foreground = fg;
        format-padding = 1;

        label = "RAM %percentage_used%%";
      };

      "module/powermenu" = {
        type = "custom/menu";
        expand-right = true;

        format = "<label-toggle> <menu>";
        format-background = bg;
        format-padding = 1;

        label-open = "";
        label-close = "";
        label-separator = "  ";

        menu-0-0 = " Suspend";
        menu-0-0-exec = "systemctl suspend";
        menu-0-1 = " Reboot";
        menu-0-1-exec = "v";
        menu-0-2 = " Shutdown";
        menu-0-2-exec = "systemctl poweroff";
      };
    };
  };
}
