with import <nixpkgs> { };

let
  prismaDrv = { stdenv, fetchurl, openssl, zlib, autoPatchelfHook, lib }:
    let
      hostname = "binaries.prisma.sh";
      channel = "all_commits";
      target = "debian-openssl-1.1.x";
      baseUrl = "https://${hostname}/${channel}";
      commit = "f3e341280d96d0abc068f97e959ddf01f321a858"; # Version 2.24
      hashes = {
        introspection-engine = "bee9126431463fae8632e2871dff2a41e3266b0fd36669846d0262575bff0396";
        migration-engine = "eee7fd869c7f5459315b711f170f1c958a71e862aa8c15e74833355cac31936a";
        prisma-fmt = "ee481e030fb69745832a85236ab8094ab4b96f73cd2011cca3e14011721303f6";
        query-engine = "5af5bf17efd259a74bb98e8e9426664581b0914ed11e319904545ebd0ae28061";
      };
      files = lib.mapAttrs
        (name: sha256: fetchurl {
          url = "${baseUrl}/${commit}/${target}/${name}.gz";
          inherit sha256;
        })
        hashes;
      unzipCommands = lib.mapAttrsToList (name: file: "gunzip -c ${file} > $out/bin/${name}") files;
    in
    stdenv.mkDerivation rec {
      pname = "prisma-bin";
      version = "2.24.0";
      nativeBuildInputs = [
        autoPatchelfHook
        zlib
        openssl
      ];
      phases = [ "buildPhase" "postFixupHooks" ];
      buildPhase = ''
        mkdir -p $out/bin
        ${lib.concatStringsSep "\n" unzipCommands}
        chmod +x $out/bin/*
      '';
    };

  prismaPkg = callPackage prismaDrv { };

in
mkShell {
  buildInputs = [
    prismaPkg
  ];
  shellHook = ''
    export PRISMA_MIGRATION_ENGINE_BINARY="${prismaPkg}/bin/migration-engine"
    export PRISMA_QUERY_ENGINE_BINARY="${prismaPkg}/bin/query-engine"
    export PRISMA_INTROSPECTION_ENGINE_BINARY="${prismaPkg}/bin/introspection-engine"
    export PRISMA_FMT_BINARY="${prismaPkg}/bin/prisma-fmt"
    export PATH="$PATH:$PWD/node_modules/.bin"
  '';
}
