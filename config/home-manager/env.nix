{ config, pkgs, lib, ... }:

{
  home.sessionVariables = {
    EDITOR            = "vim";
    NIX_PATH          = "darwin-config=/Users/jacob/.config/nixpkgs/darwin.nix:/Users/jacob/.nix-defexpr/channels";
    NIX_SSL_CERT_FILE = "/nix/var/nix/profiles/per-user/jacob/profile/etc/ssl/certs/ca-bundle.crt";

    PATH = lib.strings.concatStringsSep ":" [
      "/Users/jacob/.asdf/shims"
      "/Users/jacob/.nix-profile/bin"
      "/run/current-system/sw/bin"
      "/Users/jacob/.asdf/shims"
      "/Users/jacob/bin"
      "/Users/jacob/.go/bin"
      "/Users/jacob/.cargo/bin"
      "/Users/jacob/Library/Python/3.9/bin"
      "/usr/local/bin"
      "/usr/local/sbin"
      "/usr/bin"
      "/bin"
      "/usr/sbin"
      "/sbin/"
    ];
  };
}
