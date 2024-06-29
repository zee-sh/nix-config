{ pkgs, ... }:

{

  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 0;
    mouse = true;
    baseIndex = 1;
    terminal = "screen-256color";
    historyLimit = 100000; # scrollback size
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
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
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-pane-contents-area 'visible'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '30' # minutes
        '';
      }
      {
        plugin = extrakto;
        extraConfig = ''
          set -g @extrakto_clip_tool wl-copy
          set -g @extrakto_editor nvim
          set -g @extrakto_open_tool firefox
          set -g @extrakto_filter_order 'url path line word'
        '';
      }
      vim-tmux-navigator
      yank
      sensible
    ];

    extraConfig = ''
      # ----------------------
      # Settings
      # -----------------------

      # caps lock mapped to Home and lalt mapped to caps lock with BTT
      # Use Home key (caps lock) as prefix
      set -g prefix Home
      unbind C-b
      bind-key Home send-prefix

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

      #setw -g monitor-activity on
      #set -g visual-activity on

      #bind | split-window -h
      #bind - split-window -v

      # use the vim motion keys to move between panes
      #bind h select-pane -L
      #bind j select-pane -D
      #bind k select-pane -U
      #bind l select-pane -R

      # Use Alt-arrow keys without prefix key to switch panes
      #bind -n M-Left select-pane -L
      #bind -n M-Right select-pane -R
      #bind -n M-Up select-pane -U
      #bind -n M-Down select-pane -D

      # Shift arrow to switch windows
      #bind -n S-Left  previous-window
      #bind -n S-Right next-window

      # Shift Alt vim keys to switch windows
      #bind -n M-H previous-window
      #bind -n M-L next-window


      '';
  };


}

