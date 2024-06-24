{ pkgs, ... }: 

{
  imports = [ ./homebrew.nix];
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
  [ pkgs.vim
  ];

  #networking.computerName = "${pkgs.username}-${pkgs.system}";
  system.defaults = {
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
      #AppleShowAllExtensions = true;
      #FXDefaultSearchScope = "SCcf";
      #FXEnableExtensionChangeWarning = false;
      ShowPathbar = true;
      ShowStatusBar = true; # show status bar
      QuitMenuItem = true; # enable quit menu item
    };
    screencapture = {
      disable-shadow = true;
      location = "/Users/zeeshans/Documents";
    };
    NSGlobalDomain = {
      ApplePressAndHoldEnabled = false; # Disable press and hold for diacritics. Allows j and k movement in vim
      #AppleKeyboardUIMode = 3;
      #"com.apple.keyboard.fnState" = true;
      #NSAutomaticWindowAnimationsEnabled = false;
    };
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  
  # Declare the user that will be running `nix-darwin`.
  users.users.zeeshans = {
    name = "zeeshans";
    home = "/Users/zeeshans";
    shell = pkgs.fish;
  };

   security.pam.enableSudoTouchIdAuth = true;

  # zsh is the default shell on Mac and we want to make sure that we're
  # configuring the rc correctly with nix-darwin paths.
  programs.zsh.enable = true;
  programs.fish.enable = true;

  environment.shells = with pkgs; [ bashInteractive zsh fish ];
  
  # Fonts
  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
     recursive
     (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
   ];

  # Store management
  nix.gc.automatic = true;
  nix.gc.interval.Hour = 3;
  nix.gc.options = "--delete-older-than 15d";
  nix.optimise.automatic = true;
  nix.optimise.interval.Hour = 4;

}
