{ config, pkgs, lib, ... }:

{
    programs.fish = {
        enable = true;
        promptInit = ''
            any-nix-shell fish --info-right | source
        '';
    };
}