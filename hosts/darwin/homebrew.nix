{pkgs, ...}: 

{
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";

    taps = [];
    brews = [
      "coreutils"
      "cowsay"
      #"devutils"
      "m-cli" #  Swiss Army Knife for macOS
      "mas" # mas-cli
    ];
    casks = [
      #"1password"
      "alt-tab"	
      "appcleaner"
      #"authy"
      "blurred"
      "balenaetcher"
      #"brave-browser"
      #"cold-turkey-blocker"
      #"docker"
      #"firefox"
      "flux"
      #"google-chrome"
      "hammerspoon"
      "hazel"
      "hyperkey"
      #"iina" # video player
      "jordanbaird-ice"
      #"little-snitch"
      "LuLu"
      #"microsoft-teams"
      #"microsoft-remote-desktop"
      "micro-snitch"
      #"mitmproxy"
      #"monitorcontrol" # Brightness and volume controls for external monitors.
      #"obsidian"
      "raycast"
      "rectangle"
      #"setapp"
      "skype"
      "soulver-cli"
      "vlc"
      #"little-snitch"
      #"utm" # Virtual Machine Manager
      "visual-studio-code"
      "wezterm"
      #"whatsapp"
      #wireshark
      "zoom"
    ];
    masApps = {
      #"one-thing" = 1604176982;
      #"hyperduck" =6444667067;
      #Slack = 803453959;
      #"Kindle" = 302584613;
      #"Tailscale" = 1475387142;
      #"Todoist" = 585829637;
      #"Dropover" = 1355679052;
      #"LosslessCut" = 1505323402;
    };
  };
}

