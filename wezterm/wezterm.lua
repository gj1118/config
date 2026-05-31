local wezterm = require "wezterm"
local config = wezterm.config_builder()

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    -- return "dayfox"
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

config.font = wezterm.font(
  -- { family = "Cascadia Code", weight = 'Regular' },
  { family = "Agave", weight = 'Regular' }
)

config.keys = {
  -- Split horizontally (left/right panes)
  {
    key = 'v',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },

  -- Split vertically (top/bottom panes)
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  {
    key = 'Q',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.PaneSelect { mode = 'SwapWithActiveKeepFocus' },
  },
  -- navigate between panes
  { key = 'LeftArrow',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
  -- resize panes:
  { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Left', 5 } },
  { key = 'RightArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Right', 5 } },
  { key = 'UpArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Up', 5 } },
  { key = 'DownArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Down', 5 } },
}

config.use_fancy_tab_bar= false
config.enable_tab_bar = false
config.font_size=18
-- config.window_background_opacity = 0.94 
config.adjust_window_size_when_changing_font_size = true
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
return config

