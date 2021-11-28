let
    artifact = import ./artifact.nix;
    nixpkgs = artifact.nixpkgs;
in nixpkgs.haskell.lib.buildStackProject {
    LANG = "en_US.UTF-8";
    ghc = artifact.ghc;
    name = artifact.name;
    buildInputs = [
        # Build-time system dependencies.
        nixpkgs.cacert
        nixpkgs.coreutils
        nixpkgs.findutils
        nixpkgs.gnutar
        nixpkgs.zlib
    ] ++ artifact.dependencies;
    src = if nixpkgs.lib.inNixShell then null else ./.; # Only needed for nix-build, and causes problems for nix-shell during local development.
}