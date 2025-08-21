{
  description = "My collection of Nix Flakes for easily creating Nix Shell environments for new projects.";

  outputs = { self, nixpkgs }: {
    templates.fish = {
      path = ./fish;
      description = "A generic shell environment setup with Fish";
    };

    templates.rust = {
      path = ./rust;
      description = "A nix shell environment ready for Rust development.";
    };
  };
}
