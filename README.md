# My NixOS config

That repo contains my nixos config based on [home-manager](https://github.com/nix-community/home-manager)

``config`` folder goes to ``/etc/config`` and ``nixpkgs`` folder goes to ``~/.config/nixpkgs``

The ``templates`` folder contains some examples on how to use nix shells for custom environments, mostly for development


## 1 - Installation

// TODO

## 2 - LICENSE

WTFPL

## 3 - Tips and Tricks

### Q: How to get the sha256 hash of a repo?

A: nix-prefetch-url --unpack https://github.com/${owner}/${repo}/archive/${rev}.tar.gz

### Q: Webstorm shows an error when opening a terminal inside a nix shell:

A: Go to Settings -> Terminal and disable ``Shell Integration``