{
  description = "Creates a nix shell setup for Rust development";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ rust-overlay.overlays.default ];
        };

        rustToolchain = pkgs.rust-bin.stable.latest.default.override {
            extensions = [ 
                # Add rustup components here
                "rust-src"
                "rust-analyzer"
                "clippy"
            ];
          targets = [
            # Add build targets here
          ];
        };

        cargoExtensions = with pkgs; [
            # Add cargo extensions that are part of nix pkgs here 
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [ 
            # Add packages here
            rustToolchain
            pkgs.mask
            pkgs.bacon
          ] ++ cargoExtensions;

          # Optional env vars
          RUST_SRC_PATH = "${rustToolchain}/lib/rustlib/src/rust/library";
          shellHook = ''
            # Makes sure the Rust toolchain tools are in the PATH
            export PATH="${rustToolchain}/bin:$PATH"

            # Install cargo extensions that are not in Nix pkgs here
            # cargo install <extension-name>

            echo "Rust $(rustc --version) ready!"
          '';
        };
      });
}
