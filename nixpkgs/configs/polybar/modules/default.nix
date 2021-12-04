let
  audio = import ./audio.nix;
  cpu = import ./cpu.nix;
  date = import ./date.nix;
  distro = import ./distro.nix;
  i3 = import ./i3.nix;
  memory = import ./memory.nix;
  powermenu = import ./power-menu.nix;
  title = import ./title.nix;
in
{ } // audio // cpu // date // distro // i3 // memory // powermenu // title
