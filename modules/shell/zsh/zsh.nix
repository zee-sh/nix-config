{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    shellAliases = (import ../aliases.nix { inherit pkgs; }).shell;

    dirHashes = {
      config = "$HOME/.config/";
      desk = "$HOME/Desktop";
      nixc = "$HOME/nix-config";
    };

    #initExtra = "${builtins.readFile ../config/zsh/config.zsh}";
    envExtra = ''
    alias assume="source assume"
    export GRANTED_ALIAS_CONFIGURED="true"
    fpath=(/Users/zeeshans/.granted/zsh_autocomplete/assume/ $fpath)
    fpath=(/Users/zeeshans/.granted/zsh_autocomplete/granted/ $fpath)
    '';
    initExtraFirst = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
    initExtra = ''
      alias k=kubectl
      source <(kubectl completion zsh)
      compdef k='kubectl'
 
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
      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down

      bindkey '⌥<-' backward-word
      bindkey '⌥->' forward-word
      bindkey '⌘⌫' backward-kill-line
      bindkey '⌘z' undo
      bindkey '⌘⇪z' redo

      # handy keybindings
      #bindkey "^A" beginning-of-line
      #bindkey "^E" end-of-line
      #bindkey "^K" kill-line
      #bindkey "^R" history-incremental-search-backward

      # Navigate words with ctrl+arrow keys
      #bindkey '^[Oc' forward-word                                     #
      #bindkey '^[Od' backward-word                                    #
      #bindkey '^[[1;5D' backward-word                                 #
      #bindkey '^[[1;5C' forward-word                                  #
      #bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
      #bindkey '^[[Z' undo                                             # Shift+tab undo last action

      zle -N fzf-search-files
      bindkey '^F' fzf-search-files

      # shift-tab : go backward in menu (invert of tab)
      bindkey '^[[Z' reverse-menu-complete

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
        #"history*"
      ];
      path  = "${config.xdg.configHome}/zsh/history";
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
