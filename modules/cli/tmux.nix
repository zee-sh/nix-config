{ pkgs, ... }:

{

  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 0;
    mouse = true;
    baseIndex = 1;
    historyLimit = 100000; # scrollback size
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'macchiato'
          set -g @plugin 'tmux-plugins/tpm'
          set -g @plugin 'catppuccin/tmux'
          set -g @plugin 'christoomey/vim-tmux-navigator'

          set -g @catppuccin_window_left_separator ""
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"

          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"

          set -g @catppuccin_status_modules_right "directory session"
          set -g @catppuccin_status_left_separator  " "
          set -g @catppuccin_status_right_separator ""
          set -g @catppuccin_status_right_separator_inverse "no"
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"

          set -g @catppuccin_directory_text "#{pane_current_path}"
         '';
      }
    ];

    extraConfig = ''
      # ----------------------
      # Settings
      # -----------------------

      # set first window to index 1 (not 0) to map more to the keyboard layout
      set -g base-index 1
      set -g pane-base-index 1

      # Enable focus events.
      set -g focus-events on

      # Automatically rename window titles.
      setw -g automatic-rename on
      set -g set-titles on

      # Automatically renumber windows when a window is closed.
      set -g renumber-windows on

      # Mouse support
      set -g mouse on

      set -g detach-on-destroy off  # don't exit from tmux when closing a session

      set -g set-clipboard on

      #set -g status-position top
      set -g pane-active-border-style 'fg=magenta,bg=default'
      set -g pane-border-style 'fg=brightblack,bg=default'

      '';
  };


}

