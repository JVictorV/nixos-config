{ pkgs, ... }:

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
          background = "#e8e9ec";
          foreground = "#33374c";
        };

        cursor = {
          text = "#e8e9ec";
          cursor = "#33374c";
        };

        normal = {
          black = "#dcdfe7";
          red = "#cc517a";
          green = "#668e3d";
          yellow = "#c57339";
          blue = "#2d539e";
          magenta = "#7759b4";
          cyan = "#3f83a6";
          white = "#33374c";
        };

        bright = {
          black = "#8389a3";
          red = "#cc3768";
          green = "#598030";
          yellow = "#b6662d";
          blue = "#22478e";
          magenta = "#6845ad";
          cyan = "#327698";
          white = "#262a3f";
        };

        selection = {
          background = "#33374c";
          text = "#e8e9ec";
        };
      };

      shell = {
        program = "fish";
      };
    };
  };
}
