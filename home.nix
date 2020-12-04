{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jacob";
  home.homeDirectory = "/Users/jacob";

  home.stateVersion = "21.03";

  home.sessionVariables = {
    EDITOR =  "vim";
    PATH = "/Users/jacob/.nix-profile/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin/";
    NIX_PATH = "/Users/jacob/.nix-defexpr/channels";
  };

  xdg.enable = true;
  xdg.configHome = "/Users/jacob/.config";
  xdg.dataHome = "/Users/jacob/.local/share";
  xdg.cacheHome = "/Users/jacob/.cache";

  home.file.".Brewfile".source = ./home/Brewfile;

  programs.fish.enable = true;

  programs.bat.enable = true;
  programs.git = { 
    enable = true;
    userName = "Jacob Bednarz";
    userEmail = "jacob.bednarz@gmail.com";
  };
}
