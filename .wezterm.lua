-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'catppuccin-frappe'

-- font
config.font_size = 18.0 -- default font size


-- cursor style
config.default_cursor_style = "BlinkingBar"

-- and finally, return the configuration to wezterm
return config
