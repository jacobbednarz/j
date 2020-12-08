{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    # extraConfig = builtins.readFile ./home/extraConfig.vim;

    plugins = with pkgs.vimPlugins; [
      # syntax/langugage support
      vim-nix
      vim-ruby # ruby
      vim-go   # go
      vim-fish # fish
      vim-toml # toml
      rust-vim # rust
      
      # editor 
      vim-endwise # add end, } after opening block
      ale         # linting
      nerdtree    # file tree

      # misc
      vim-fugitive # Gblame      
    ];
  };
}