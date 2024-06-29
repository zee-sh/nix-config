{pkgs, ...}:

{

  #networking.computerName = "${pkgs.username}-${pkgs.system}";
  # https://github.com/zmre/nix-config/blob/main/modules/darwin/preferences.nix
  # https://github.com/neapsix/.dotfiles/blob/master/macos_setup/macos_setup.sh
  # https://github.com/LnL7/nix-darwin/tree/master/modules/system/defaults

  system.defaults = {

    loginwindow = {
      # disable guest account
      GuestEnabled = false;
      # show name instead of username
      SHOWFULLNAME = false;
      # Disables the ability for a user to access the console by typing “>console” for a username at the login window.
      #DisableConsoleAccess = true;
    };

    dock = {
      autohide = true;
      #orientation = "left";
      #show-process-indicators = false;
      #show-recents = false;
      #static-only = true;
      # 0: no-op 2: Mission Control 3: Show application windows 4: Desktop 5: Start screen saver 6: Disable screen saver 7: Dashboard  10: Put display to sleep  11: Launchpad
      # 12: Notification Center
      wvous-tl-corner = 2; # top-left - Mission Control
      wvous-tr-corner = 4; # top-right - Desktop
      wvous-bl-corner = 3; # bottom-left - Application Windows
      wvous-br-corner = 13; # bottom-right - Lock Screen
    };

    finder = {
      AppleShowAllExtensions = true;
      #FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;
      ShowPathbar = true;
      ShowStatusBar = true; # show status bar
      QuitMenuItem = true; # enable quit menu item
    };

    screencapture = {
      disable-shadow = true;
      location = "/Users/zeeshans/Downloads";
    };

    NSGlobalDomain = {
      ApplePressAndHoldEnabled = false; # Disable press and hold for diacritics. Allows j and k movement in vim
      #AppleKeyboardUIMode = 3;
      #"com.apple.keyboard.fnState" = true;
      #NSAutomaticWindowAnimationsEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      # no automatic smart quotes
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;

    };
  };

}

