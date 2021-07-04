{ pkgs, ... }:

let
  bg = "#FAFAFA";
  fg = "#231F20";

  black = "#231F20";
  red = "#F07171";
  green = "#86B300";
  yellow = "#F2AE49";
  blue = "#399EE6";
  magenta = "#A37ACC";
  cyan = "#4CBF99";
  white = "#FAFAFA";
in
{
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        normal = {
          family = "FuraCode Nerd Font";
          style = "Regular";
        };
        size = 14.0;
      };

      colors = {
        primary = {
          background = bg;
          foreground = fg;
        };

        normal = {
          black = black;
          red = red;
          green = green;
          yellow = yellow;
          blue = blue;
          magenta = magenta;
          cyan = cyan;
          white = white;
        };
      };

      shell = {
        program = "fish";
      };
    };
  };
}
