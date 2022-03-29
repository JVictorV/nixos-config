let pkgs = import <nixpkgs> { overlays = [ (import ./cypress-overlay.nix) ]; };
in pkgs.mkShell {
  name = "cypress-shell";

  buildInputs = with pkgs; [
    cypress
    # your packages here
  ];

  shellHook = ''
    export CYPRESS_INSTALL_BINARY=0
    export CYPRESS_RUN_BINARY=${pkgs.cypress}/bin/Cypress
  '';
}