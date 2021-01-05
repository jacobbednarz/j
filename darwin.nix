{ config, pkgs, ... }:

{
  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin.nix";

  users.users.jacob = {
    home = "/Users/jacob";
    description = "Jacob Bednarz";
    shell = pkgs.fish;
  };

  # auto-correct
  system.defaults.NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;

  # show all file extensions
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;

  # always show scrollbars
  system.defaults.NSGlobalDomain.AppleShowScrollBars = "Always";

  # don't use scroll like a weirdo
  system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;

  # metric system ftw
  system.defaults.NSGlobalDomain.AppleMeasurementUnits = "Centimeters";
  system.defaults.NSGlobalDomain.AppleMetricUnits = 1;
  system.defaults.NSGlobalDomain.AppleTemperatureUnit = "Celsius";

  # dock
  system.defaults.dock.autohide = true;
  system.defaults.dock.orientation = "left";
  system.defaults.dock.showhidden = true;
  system.defaults.dock.mru-spaces = false;
  system.defaults.dock.tilesize = 32;

  # finder
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.QuitMenuItem = true;
  system.defaults.finder.FXEnableExtensionChangeWarning = false;

  # keyboard / trackpad
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;
  system.defaults.trackpad.TrackpadRightClick = true;

  # software updates
  system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

  # login
  system.defaults.loginwindow.GuestEnabled = false;
}
