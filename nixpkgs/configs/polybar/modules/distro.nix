{
  "module/distro" = {
    type = "custom/script";
    exec = "uname -r";
    interval = 999999999;

    format = {
      text = " <label>";
      padding = 1;
    };

    label = {
      text = "%output%";
      font = 1;
    };
  };
}
