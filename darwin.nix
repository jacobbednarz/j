{ config, pkgs, ... }:

{
  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin.nix";

  users.users.jacob = {
    home = "/Users/jacob";
    description = "Jacob Bednarz";
    shell = pkgs.fish;
  };
}
