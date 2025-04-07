{ pkgs, ... }: 

{
  imports = [ ./homebrew.nix ./preferences.nix];
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
  [ pkgs.vim
    pkgs.devenv
    pkgs.cachix
  ];

  # Auto upgrade nix package and the daemon service.
  #services.nix-daemon.enable = true;
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
    shell = pkgs.zsh;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  # zsh is the default shell on Mac and we want to make sure that we're
  # configuring the rc correctly with nix-darwin paths.
  programs.zsh.enable = true;
  programs.fish.enable = true;

  environment.shells = with pkgs; [ bashInteractive zsh fish ];
  
  # Fonts
  fonts.packages = [
     pkgs.nerd-fonts.jetbrains-mono
     pkgs.nerd-fonts.fira-code
     pkgs.nerd-fonts.sauce-code-pro
     pkgs.nerd-fonts.inconsolata
   ];

   # for all fonts
   # fonts.packages = [ ... ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts)

  # Store management
  nix.gc.automatic = true;
  nix.gc.interval.Hour = 3;
  nix.gc.options = "--delete-older-than 15d";
  nix.optimise.automatic = true;
  nix.optimise.interval.Hour = 4;

  nixpkgs.config = {
    allowUnfree = true;
  };

}
