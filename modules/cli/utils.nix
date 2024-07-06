{ pkgs, ... }:

{

  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    flags = [ "--disable-up-arrow" ];
    #settings = {
    #  enter_accept = true;
    #  search_mode = "fuzzy";
    #  style = "full";
    #};
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  # Fancy replacement for cat
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch prettybat];
    syntaxes = { };
    config = {
      tabs = "4";
      theme = "Catppuccin Mocha";
    };

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
      "Catppuccin Mocha" = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "d714cc1d358ea51bfc02550dabab693f70cccea0";
          sha256 = "sha256-Q5B4NDrfCIK3UAMs94vdXnR42k4AXCqZz6sRn8bzmf4=";
        };
        file = "themes/Catppuccin Mocha.tmTheme";
      };
    };
  };

  programs.bottom = {
    enable = true;
  };
  
  # Replacement for ls
  programs.eza = {
    enable = true;
    git = true;
    icons = true;
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
    #defaultOptions = [
    #  "--color=light"
    #];
    colors = {
      "bg+"="#293739";
      bg="#1B1D1E";
      border="#808080";
      spinner="#E6DB74";
      hl="#7E8E91";
      fg="#F8F8F2";
      header="#7E8E91";
      info="#A6E22E";
      pointer="#A6E22E";
      marker="#F92672";
      "fg+"="#F8F8F2";
      prompt="#F92672";
      "hl+"="#F92672";
      };
    tmux = {
      enableShellIntegration = true;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    #enableFishIntegration = true;
    enableNushellIntegration = true;
  };
}

