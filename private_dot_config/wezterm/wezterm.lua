local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- UI/UX
config.hide_tab_bar_if_only_one_tab = true -- Show tab bar only if multiple tabs are open

return config
