{ config, pkgs, ... }:

{
  # let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "jacob";
  home.homeDirectory = "/Users/jacob";
  home.stateVersion = "21.05";

  # home.nix is basically the entrypoint for all other topic files that live
  # under the home-manager directory.
  imports = [
    ./config/home-manager/xdg.nix
    ./config/home-manager/env.nix
    ./config/home-manager/bin.nix
    ./config/home-manager/ssh.nix
    ./config/home-manager/fish.nix
    ./config/home-manager/git.nix
    ./config/home-manager/gnupg.nix
    ./config/home-manager/homebrew.nix
    ./config/home-manager/rectangle.nix
    ./config/home-manager/vscode.nix
    ./config/home-manager/fzf.nix
    ./config/home-manager/direnv.nix
    ./config/home-manager/neovim.nix
    ./config/home-manager/asdf-vm.nix
    ./config/home-manager/terraform.nix
  ];

  # no need to tell me there is news, i'll check on my own
  news.display = "silent";
}
