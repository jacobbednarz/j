# j

dotfiles; delivered via nix, nix-darwin and home-manager

## Install

- `git clone https://github.com/jacobbednarz/j/ ~/src/j` 
- `sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume`
- `ln -sf /Users/jacob/src/j/ /Users/jacob/.config/nixpkgs`
- `/Users/jacob/.config/nixpkgs/install`

## Overview

- `home.nix` - Entrypoint for `home-manager` which includes individual topic 
  based configuration files.
- `darwin.nix` - Configuration for  for `nix-darwin`.
- `config` - Directory containing individual system or application configuration 
  for topics.
- `config/*.nix` - Individual topic configuration files (written in nix).