local wezterm = require("wezterm")
local config = wezterm.config_builder()

local act = wezterm.action

local function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    -- return "dayfox"
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end


config = {
  use_fancy_tab_bar = false,
  -- window_background_opacity = 0.94 ,
  adjust_window_size_when_changing_font_size = true,
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),

  initial_cols = 130,
  initial_rows = 45,
  automatically_reload_config = true,
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  font = wezterm.font("Liga Agave", { weight = "Regular" }),
  font_size = 23,
  background = {
    {
      source = {
        File = "/Users/gjanjua/sandbox/wallpaper/termbackground.png",
      },
      width = "100%",
      height = "100%",
      opacity = 0.87,
    }
  },
  default_cursor_style = 'BlinkingBlock',
  -- window_background_opacity = 0.9,
  -- On macOS, this adds blur effect
  macos_window_background_blur = 90,

  keys = {
    { key = "Enter", mods = "SUPER", action = act.ToggleFullScreen },
    { key = "Enter", mods = "ALT",   action = act.DisableDefaultAssignment },
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
    { key = 'LeftArrow',  mods = 'ALT',        action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'ALT',        action = wezterm.action.ActivatePaneDirection 'Right' },
    { key = 'UpArrow',    mods = 'ALT',        action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'DownArrow',  mods = 'ALT',        action = wezterm.action.ActivatePaneDirection 'Down' },
    -- resize panes:
    { key = 'LeftArrow',  mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Left', 5 } },
    { key = 'RightArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Right', 5 } },
    { key = 'UpArrow',    mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Up', 5 } },
    { key = 'DownArrow',  mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Down', 5 } },

  },
}
return config

