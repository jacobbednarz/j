# j

dotfiles; delivered via nix, nix-darwin and home-manager

## Install


- `git clone https://github.com/jacobbednarz/j/ ~/src/j`
- `curl -L https://nixos.org/nix/install | sh`
- `nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer`
- `./result/bin/darwin-installer`
- `nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager`
- `nix-channel --update`
- `ln -sf /Users/jacob/src/j /Users/jacob/.config/home-manager`
- `/Users/jacob/.config/nixpkgs/install`

## Overview

- `home.nix` - Entrypoint for `home-manager` which includes individual topic
  based configuration files.
- `darwin.nix` - Configuration for  for `nix-darwin`.
- `config` - Directory containing individual system or application configuration
  for topics.
- `config/*.nix` - Individual topic configuration files (written in nix).
