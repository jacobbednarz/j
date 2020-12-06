{ config, pkgs, ... }:

{
  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin.nix";

  environment.systemPackages = [];
}
