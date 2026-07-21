local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- General
config.max_fps = 120
config.animation_fps = 60

config.window_close_confirmation = "NeverPrompt"
config.color_scheme = "Tokyo Night"
config.hide_tab_bar_if_only_one_tab = true
config.automatically_reload_config = true
config.freetype_load_flags = "NO_HINTING"
config.term = "xterm-256color"

-- Font
config.font_size = 11.5
config.font = wezterm.font_with_fallback({
	{ family = "FiraCode Nerd Font Propo", weight = "Medium" },
	{ family = "Liga SFMono Nerd Font", weight = "Medium" },
})
config.line_height = 1.05

-- Tmux like controls
config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 2000 }

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(key)
	return {
		key = key,
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
		end),
	}
end

-- Bind Keys
-- been configured to mimic some of the default tmux key bindings
config.keys = {
	{
		key = "Backspace",
		mods = "CTRL",
		action = wezterm.action.SendString("\x17"),
	},
	split_nav("h"),
	split_nav("j"),
	split_nav("k"),
	split_nav("l"),
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = '"',
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
}

-- Start maximized
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- Tab Bar
config.window_frame = {
	font_size = 10,
}

return config
