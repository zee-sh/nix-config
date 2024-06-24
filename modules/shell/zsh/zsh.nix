{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    shellAliases = (import ../aliases.nix { inherit pkgs; }).shell;
    #initExtra = "${builtins.readFile ../config/zsh/config.zsh}";
    initExtraFirst = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
    initExtra = ''
      HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=yellow,fg=black,bold"
      HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="bg=red,fg=black,bold"

      # Completion
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

      # fzf-tab
      zstyle ':completion:*:git-checkout:*' sort false
      zstyle ':completion:*:descriptions' format '[%d]'
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --icons -a --group-directories-first --git --color=always $realpath'
      zstyle ':fzf-tab:*' switch-group ',' '.'

      # Bind Keys
      bindkey '^[[A' history-beginning-search-backward
      bindkey '^[[B' history-beginning-search-forward
      bindkey '⌥<-' backward-word
      bindkey '⌥->' forward-word
      bindkey '⌘⌫' backward-kill-line
      bindkey '⌘z' undo
      bindkey '⌘⇪z' redo

    config() {
     # navigate to the config file for a specific app
     cd "$XDG_CONFIG_HOME/$1" || echo "$1 is not a valid config directory."
     }
  '';
    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
      save = 100000;
      size = 100000;
      share = true;
      ignorePatterns = [
        #"(ls|cd|pwd|exit|mcd|dr)*"
        "git commit*"
        "git clone*"
        "git add*"
        #"history*"
      ];
      #path = "${config.xdg.dataHome}/zsh/zsh_history";
    };

    plugins = [
      {
        name = "fzf-tab";
        file = "fzf-tab.zsh";
        src = pkgs.fetchgit {
          url = "https://github.com/Aloxaf/fzf-tab";
          sha256 = "sha256-o8hgnTl84nI7jMVfA5jEcDXkMFFlnxKbRva+l/Fx4jI=";
        };
      }
      {
        name = "zsh-notify";
        file = "auto-notify.plugin.zsh";
        src = pkgs.fetchgit {
          url = "https://github.com/MichaelAquilina/zsh-auto-notify";
          sha256 = "sha256-U4XJymu2SDzBAXTp88utcQRwYnOUY4RVXYrtGFbh3dM=";
        };
      }
      {
        name = "ssh-completion";
        file = "zsh-ssh.zsh";
        src = pkgs.fetchgit {
          url = "https://github.com/sunlei/zsh-ssh";
          sha256 = "sha256-UPrIlyAUt9cnF+gb2j+vNGAMuwFOtlfHTjKzsni73WU=";
        };
      }
      {
        name = "fast-zsh-syntax";
        file = "fast-syntax-highlighting.plugin.zsh";
        src = pkgs.fetchgit {
          url = "https://github.com/zdharma-continuum/fast-syntax-highlighting";
          sha256 = "sha256-RVX9ZSzjBW3LpFs2W86lKI6vtcvDWP6EPxzeTcRZua4=";
        };
      }
      {
        name = "zsh-autosuggestions";
        file = "zsh-autosuggestions.zsh";
        src = pkgs.fetchgit {
          url = "https://github.com/zsh-users/zsh-autosuggestions";
          sha256 = "sha256-B+Kz3B7d97CM/3ztpQyVkE6EfMipVF8Y4HJNfSRXHtU=";
        };
      }
      {
        name = "zsh-sudo";
        file = "plugins/sudo/sudo.plugin.zsh";
        src = pkgs.fetchgit {
          url = "https://github.com/ohmyzsh/ohmyzsh";
          sha256 = "sha256-fI69Xxu1nkTrxLav21I9BGht3f5mG99vmreBtHDrTow=";
          sparseCheckout = [ "plugins/sudo" ];
        };
      }
      {
        name = "zsh-history-substring-search";
        src = fetchGit {
          url = "https://github.com/zsh-users/zsh-history-substring-search.git";
          rev = "0f80b8eb3368b46e5e573c1d91ae69eb095db3fb";
        };
      }
      {
        name = "you-should-use";
        src = pkgs.fetchFromGitHub {
          owner = "MichaelAquilina";
          repo = "zsh-you-should-use";
          rev = "1.7.3";
          sha256 = "/uVFyplnlg9mETMi7myIndO6IG7Wr9M7xDFfY1pG5Lc=";
        };
      }
   ];
  };
}
