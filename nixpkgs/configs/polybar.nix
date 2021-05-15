{ pkgs, ... }:

{
  services.polybar = {
    enable = true;

    package = pkgs.polybar.override {
      i3GapsSupport = true;
      alsaSupport = true;
    };

    script = "polybar -q -r top & polybar -q -r bottom &";

    config = {
      "bar/bottom" = {
        bottom = true;
        fixed-center = true;	
      };
    };
  };
}
