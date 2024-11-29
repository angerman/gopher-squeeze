{
  description = "Gopher and Haskell Integration Example";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            go # Go compiler for building Go parts
            gcc # C compiler for building C parts
            gnumake # Make tool for using Makefile
            cabal-install # Cabal for building Haskell parts
            ghc # GHC for building Haskell parts
          ];
        };
      }
    );
}