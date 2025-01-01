local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = wezterm.config_builder()

config.automatically_reload_config = true
-- config.color_scheme = "Nebula (base16)"
config.font = wezterm.font_with_fallback {
	"Hack Nerd Font",
	"Symbols Nerd Font",
  "HackGen Console",
}
config.font_size = 14
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.use_fancy_tab_bar = true
config.use_ime = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.send_composed_key_when_left_alt_is_pressed = true

config.initial_cols = 135
config.initial_rows = 40

return config;
