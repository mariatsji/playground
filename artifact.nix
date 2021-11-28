let
    nixpkgs = import (fetchTarball https://github.com/nixos/nixpkgs/archive/071317d543205ee5f5611d391a37582f9b282240.tar.gz) {};
    name = nixpkgs.lib.strings.fileContents ./.artifactname;
in
{
    inherit name;
    ghc = nixpkgs.haskell.compiler.ghc8107; # ghc version for this stack resolver
    nixpkgs = nixpkgs; # we lock all nix things to this version of nixpkgs
    dependencies = [
        nixpkgs.zlib
        nixpkgs.rdkafka
        nixpkgs.postgresql
        nixpkgs.cacert
        # List of nix packages, see https://search.nixos.org/packages.
    ];
    binaryName = name;
    extraDirs = [ ]; # extra directories that will be linked relative to binary inside docker
}