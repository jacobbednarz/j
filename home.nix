{ config, pkgs, lib, ... }:

{
  # let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "jacob";
  home.homeDirectory = "/Users/jacob";
  home.stateVersion = "21.05";

  # home.nix is basically the entrypoint for all other topic files that live
  # under the home-manager directory.
  imports = [
    ./config/home-manager/darwin.nix
    ./config/home-manager/cloudflare-warp.nix
    ./config/home-manager/xdg.nix
    ./config/home-manager/env.nix
    ./config/home-manager/bin.nix
    ./config/home-manager/ssh.nix
    ./config/home-manager/tmux.nix
    ./config/home-manager/kitty.nix
    ./config/home-manager/fish.nix
    ./config/home-manager/git.nix
    ./config/home-manager/gnupg.nix
    ./config/home-manager/homebrew.nix
    ./config/home-manager/rectangle.nix
    ./config/home-manager/vscode.nix
    ./config/home-manager/fzf.nix
    ./config/home-manager/neovim.nix
    ./config/home-manager/asdf-vm.nix
    ./config/home-manager/terraform.nix
  ];

  home.packages = with pkgs; [
    asdf-vm # version manager for all
    autojump # use `j` to jump around
    awscli2 # v2 of AWS CLI
    comby # structured code search and replace
    coreutils
    curl
    delve # go debugger
    dive # explore docker image layers
    direnv
    dnsmasq
    dogdns # modern dig
    dstp # common reachability checks for your site
    du-dust # modern du
    fd # modern find
    gdb
    gh # legacy GitHub CLI
    git
    glances # modern top/htop
    gnupg
    graphviz
    grepcidr # filter IPs using regex
    grex # build more efficient regex
    gron # make JSON greppable
    grpcurl # curl, but for gRPC
    hexyl # hex viewer
    hping
    htop # process viewer
    jo # JSON builder
    jq  # JSON parser and filtering
    kitty # shell
    kubernetes-helm
    libressl # SSL/TLS implementation instead of openssl
    mitmproxy
    mtr
    ngrep
    nmap
    postgresql
    pinentry_mac
    plantuml
    pstree
    rdap
    re2 # regex implementation
    reattach-to-user-namespace # wrapper for accessing MacOS pasteboard
    ripgrep # faster grep
    sd # actually usable `sed`
    shadowenv
    shellcheck
    sipcalc
    socat
    tree
    websocat # toolkit for websockets
    wget
    whois
    wrk
    yq
    yubikey-agent
    yubikey-manager
  ];

  # no need to tell me there is news, i'll check on my own
  news.display = "silent";
}
