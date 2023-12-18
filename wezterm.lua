local wezterm = require 'wezterm'
local act = wezterm.action

local config = {
  -- colors
  color_scheme = '3024 Night',
  -- font
  font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "Noto Color Emoji",
    "Symbols Nerd Font Mono",
  }),
  -- scrollback
  scrollback_lines = 100000,
}


config.keys = {
  -- This will create a new split and run the `top` program inside it
  {
    key = '-',
    mods = 'ALT',
    action = act.SplitPane {
      direction = 'Down',
      size = { Percent = 30 },
    },
  },
  {
    key = '=',
    mods = 'ALT',
    action = act.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  -- activate pane selection mode with the default alphabet (labels are "a", "s", "d", "f" and so on)
  { key = '8', mods = 'CTRL', action = act.PaneSelect },
  -- show the pane selection mode, but have it swap the active and selected panes
  {
    key = '0',
    mods = 'CTRL',
    action = act.PaneSelect {
      mode = 'SwapWithActive',
    },
  },
}
return config
