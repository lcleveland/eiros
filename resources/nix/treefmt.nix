# Evaluates the treefmt-nix module for this repo (nixfmt + statix + deadnix).
{ treefmt-nix, pkgs }:
treefmt-nix.lib.evalModule pkgs {
  projectRootFile = "flake.nix";
  programs.nixfmt.enable = true; # nixfmt-rfc-style
  programs.statix.enable = true;
  programs.deadnix.enable = true;
}
