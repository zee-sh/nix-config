{ pkgs, ... }:

{

  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    flags = [ "--disable-up-arrow" ];
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Fancy replacement for cat
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
    syntaxes = { };
    themes = {
      dracula = {
        src = pkgs.fetchFromGitHub {
          owner = "dracula";
          repo = "sublime";
          rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
          sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
        };
        file = "Dracula.tmTheme";
      };
    };
  };

  # Replacement for ls
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;

  };

  # Fuzzy finder
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    changeDirWidgetCommand = "fd --type d --hidden --follow --exclude .git";
    changeDirWidgetOptions = [
      "--preview '${pkgs.eza}/bin/eza --oneline --git --long {}'"
      "--color=light"
    ];
    historyWidgetOptions = [
      "--sort"
    ];
    fileWidgetCommand = "fd --type f --hidden --follow --exclude .git";
    fileWidgetOptions = [
      "--preview '${pkgs.bat}/bin/bat --color=always --style=numbers --line-range :300 {}'"
      "--color=light"
    ];
    defaultCommand = "fd --type f --hidden --follow --exclude .git";
    defaultOptions = [
      "--color=light"
    ];
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    #enableFishIntegration = true;
    enableNushellIntegration = true;
  };
}

