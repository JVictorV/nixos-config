let
  defaultBar = import ./defaultBar.nix;
in
{
  "bar/top" = {
    bottom = false;

    modules = {
      left = "distro powermenu";
      center = "title";
      right = "cpu memory";
    };
  } // defaultBar;
}
