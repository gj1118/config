local wezterm = require "wezterm"
local config = wezterm.config_builder()

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

config.font = wezterm.font(
  { family = "Agave", weight = 'Regular' }
)

config.use_fancy_tab_bar= false
config.enable_tab_bar = false
config.font_size=16
config.window_background_opacity = 0.94 
config.adjust_window_size_when_changing_font_size = true
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
return config




