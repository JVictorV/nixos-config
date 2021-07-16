{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    colors = {
      window = {
        background = "#e8e9ec";
        border = "#33374c";
        separator = "#c3c6c8";
      };

      rows = {
        normal = {
          background = "#e8e9ec";
          backgroundAlt = "#e8e9ec";
          foreground = "#33374c";
          highlight = {
            background = "#33374c";
            foreground = "#e8e9ec";
          };
        };
      };
    };
  };
}
