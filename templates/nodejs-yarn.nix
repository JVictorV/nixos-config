let
  pkgs = import <nixpkgs> { };
in
pkgs.mkShell rec {
  name = "nodejs-yarn";

  buildInputs = with pkgs; [
    nodejs-16_x
    yarn
    # Add your global packages here
  ];
}
