-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

--------* UI *--------

-- Colorscheme
--config.color_scheme = "flexoki-dark"
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "Dracula (Official)"
-- config.color_scheme = "nordfox"

-- window settings
config.initial_cols = 150
config.initial_rows = 30

-- Font
config.font_size = 12.0
config.font = wezterm.font("JetBrains Mono")
-- config.font = wezterm.font("Hasklug Nerd Font Mono")

--config.macos_window_background_blur = 30

-- Tabs
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false

-- Scrolling
config.enable_scroll_bar = true
config.scrollback_lines = 500000
config.alternate_buffer_wheel_scroll_speed = 1
--config.hide_mouse_cursor_when_typing = false

-- and finally, return the configuration to wezterm
return config
