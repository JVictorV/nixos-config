let
  topBar = import ./top.nix;
  bottomBar = import ./bottom.nix;
in
{ } // topBar // bottomBar
