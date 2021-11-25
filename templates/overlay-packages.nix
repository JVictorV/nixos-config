let
  pkgs = import <nixpkgs> {
    overlays = [
      (self: super: {
        nodejs = super.nodejs-16_x;
      })
    ];
  };
in
pkgs.mkShell rec {
  name = "nix-shell-overlay";

  buildInputs = with pkgs; [
    nodejs # points to the nodejs package in the nixpkgs overlay
    yarn # yarn will also use the nodejs package in the nixpkgs overlay
  ];
}

