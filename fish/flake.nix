{ # This is the baseline shell env, with fish and all commonly used commands and abbriviations.
  # Use this flake as the template for createing other templates.
  description = "Basic shell with Fish and commonly used commands and abbriviations.";

  outputs = {self, nixpkgs }: 
    let 
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      forAllSystems = f: nixpkgs.lib.genAttrs systems f;
    in {
      devShells  = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              fish
              eza
              ripgrep
              bat
              coreutils
            ];

            shellHook = ''
              exec fish
            '';
          };
        }
      );
    };

}
