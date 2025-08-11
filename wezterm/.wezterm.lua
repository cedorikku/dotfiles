local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.max_fps = 60
config.window_close_confirmation = 'NeverPrompt'
config.color_scheme = "Tokyo Night"

config.font_size = 12
config.font = wezterm.font("Liga SFMono Nerd Font")
config.font = wezterm.font_with_fallback({
	"Liga SFMono Nerd Font",
	"FiraCode Nerd Font",
})

config.freetype_load_flags = "NO_HINTING"

config.default_domain = "WSL:Ubuntu"

-- Bind Keys
config.keys = {
	{
		key = "Backspace",
		mods = "CTRL",
		action = wezterm.action.SendString("\x17"),
	},
	{
		key = "n",
		mods = "SHIFT|CTRL",
        action = wezterm.action.ToggleFullScreen,
	},
}

-- Start maximized
config.window_decorations = "RESIZE"

-- Tab Bar Settings
config.window_frame = {
	font_size = 10,
	active_titlebar_bg = "#1a1b26",
	inactive_titlebar_bg = "#1a1b26",
}

return config
