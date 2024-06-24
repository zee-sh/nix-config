{pkgs, ...}: 

{     
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";

    taps = [];
    brews = [
      "cowsay"
      #"devutils"
      "m-cli" #  Swiss Army Knife for macOS
      "mas" # mas-cli
    ];
    casks = [
      #"1password"
      "alt-tab"	
      #"authy"
      "blurred"
      "balenaetcher"
      #"brave-browser"
      #"docker"
      #"firefox"
      #"google-chrome"
      "hammerspoon"
      "iina" # video player
      "jordanbaird-ice"
      "LuLu"
      #"microsoft-teams"
      #"microsoft-remote-desktop"
      #"mitmproxy"
      #"monitorcontrol" # Brightness and volume controls for external monitors.
      "raycast"
      "rectangle"
      #"setapp"
      "skype"
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
      #Slack = 803453959;
      #"Kindle" = 302584613;
      #"Tailscale" = 1475387142;
      #"Dropover" = 1355679052;
      #"LosslessCut" = 1505323402;
    };
  };
}

