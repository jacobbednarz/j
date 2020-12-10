{
  programs.fzf = {
    enable                = true;
    enableFishIntegration = true;
    defaultCommand    = "fd --type file --exclude .git";
    fileWidgetCommand = "fd --type file --exclude .git";
  };
}
