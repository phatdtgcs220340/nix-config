{
  description = "Dev shell with Neovim and Ghostty";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # Ghostty from upstream flake
    ghostty.url = "github:wez/ghostty";
  };

  outputs = { nixpkgs, flake-utils, ghostty, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            neovim
            ghostty.packages.${system}.default
            git
            ripgrep
            tree-sitter
            # Optional: nodejs or python for Neovim plugins
            nodejs
          ];

          shellHook = ''
            echo "📦 Dev environment with Neovim and Ghostty loaded"
            echo "Run ghostty with: ghostty"
          '';
        };
      });
}

