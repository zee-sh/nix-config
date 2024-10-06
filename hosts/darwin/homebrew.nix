{pkgs, ...}: 

{
  homebrew = {
    enable = true;
    global = {
      autoUpdate = true;
    };

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    taps = [
      "nikitabobko/tap"
      "common-fate/granted"
      "pulumi/tap"
    ];

    brews = [
      "coreutils"
      "cowsay"
      "granted"
      "m-cli" #  Swiss Army Knife for macOS
      "mas" # mas-cli
      "node"
      "pulumi"
      "crd2pulumi"
    ];

    casks = [
      "1password"
      "aerospace"
      "alt-tab"	
      "appcleaner"
      "aptakube"
      #"authy"
      "blurred"
      "balenaetcher"
      "brave-browser"
      "cold-turkey-blocker"
      "cursor"
      "discord"
      "docker"
      "drawio"
      "firefox"
      "flux"
      "google-chrome"
      "hammerspoon"
      "hazel"
      #"headlamp" # k8s UI
      #"hyperkey"
      "iina" # video player
      "jordanbaird-ice"
      "kindle"
      #"little-snitch"
      "linear-linear"
      "linearmouse"
      "LuLu"
      "microsoft-teams"
      "microsoft-remote-desktop"
      "micro-snitch"
      #"mitmproxy"
      #"monitorcontrol" # Brightness and volume controls for external monitors.
      "obsidian"
      "raycast"
      "rectangle"
      "setapp"
      "shottr"
      "skype"
      "slack"
      "soulver-cli"
      "syncthing"
      "todoist"
      #"vlc"
      "utm" # Virtual Machine Manager
      "visual-studio-code"
      "wezterm"
      "whatsapp"
      #"wireshark"
      "zoom"
    ];
    masApps = {
      #"one-thing" = 1604176982;
      #"hyperduck" =6444667067;
      #"Tailscale" = 1475387142;
      #"Dropover" = 1355679052;
      #"LosslessCut" = 1505323402;
    };
  };
}

