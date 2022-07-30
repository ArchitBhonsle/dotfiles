local wezterm = require('wezterm')
local catppuccin = require('colors/catppuccin').setup {}

-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
  local _ = pane
  local name = window:active_key_table()
  window:set_right_status(name and 'table: ' .. name or '')
end)

return {
  colors = catppuccin,
  default_prog = { '/usr/bin/zsh' },
  font_size = 16,
  cursor_blink_rate = 0,
  audible_bell = 'Disabled',
  check_for_updates = false,
  font = wezterm.font_with_fallback { 'JetBrainsMono Nerd Font', 'Noto Sans Mono', 'Noto Fonts Emoji' },

  disable_default_key_bindings = true,
  leader = { mods = 'CTRL', key = 'a' },
  keys = {
    { key = 'a', mods = 'LEADER|CTRL', action = wezterm.action { SendString = '\x01' } }, -- Send 'CTRL-A' to the terminal when pressing CTRL-A, CTRL-A

    { key = 'n', mods = 'CTRL|SHIFT', action = 'SpawnWindow' },

    { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action { CopyTo = 'Clipboard' } },
    { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action { PasteFrom = 'Clipboard' } },
    { key = 'Insert', mods = 'CTRL', action = wezterm.action { CopyTo = 'PrimarySelection' } },
    { key = 'Insert', mods = 'SHIFT', action = wezterm.action { PasteFrom = 'PrimarySelection' } },

    { key = '=', mods = 'CTRL', action = 'IncreaseFontSize' },
    { key = '-', mods = 'CTRL', action = 'DecreaseFontSize' },
    { key = '0', mods = 'CTRL', action = 'ResetFontSize' },

    { key = 't', mods = 'SHIFT|ALT', action = wezterm.action { SpawnTab = 'CurrentPaneDomain' } },
    { key = 'w', mods = 'SHIFT|ALT', action = wezterm.action { CloseCurrentTab = { confirm = true } } },

    { key = '1', mods = 'ALT|SHIFT', action = wezterm.action { ActivateTab = 0 } },
    { key = '2', mods = 'ALT|SHIFT', action = wezterm.action { ActivateTab = 1 } },
    { key = '3', mods = 'ALT|SHIFT', action = wezterm.action { ActivateTab = 2 } },
    { key = '4', mods = 'ALT|SHIFT', action = wezterm.action { ActivateTab = 3 } },
    { key = '5', mods = 'ALT|SHIFT', action = wezterm.action { ActivateTab = 4 } },

    { key = 'i', mods = 'ALT|SHIFT', action = wezterm.action { ActivateTabRelative = 1 } },
    { key = 'u', mods = 'ALT|SHIFT', action = wezterm.action { ActivateTabRelative = -1 } },

    { key = '1', mods = 'ALT|SHIFT|CTRL', action = wezterm.action { MoveTab = 0 } },
    { key = '2', mods = 'ALT|SHIFT|CTRL', action = wezterm.action { MoveTab = 1 } },
    { key = '3', mods = 'ALT|SHIFT|CTRL', action = wezterm.action { MoveTab = 2 } },
    { key = '4', mods = 'ALT|SHIFT|CTRL', action = wezterm.action { MoveTab = 3 } },
    { key = '5', mods = 'ALT|SHIFT|CTRL', action = wezterm.action { MoveTab = 4 } },

    { key = 'i', mods = 'ALT|SHIFT|CTRL', action = wezterm.action { MoveTabRelative = 1 } },
    { key = 'u', mods = 'ALT|SHIFT|CTRL', action = wezterm.action { MoveTabRelative = -1 } },

    { key = 'r', mods = 'ALT|SHIFT', action = 'ReloadConfiguration' },

    { key = 'm', mods = 'ALT|SHIFT', action = wezterm.action { ScrollByLine = 10 } },
    { key = 'n', mods = 'ALT|SHIFT', action = wezterm.action { ScrollByLine = -10 } },

    { key = '=', mods = 'LEADER', action = wezterm.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } } },
    { key = '-', mods = 'LEADER', action = wezterm.action { SplitVertical = { domain = 'CurrentPaneDomain' } } },
    { key = '=', mods = 'ALT|SHIFT', action = wezterm.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } } },
    { key = '-', mods = 'ALT|SHIFT', action = wezterm.action { SplitVertical = { domain = 'CurrentPaneDomain' } } },

    { key = 'h', mods = 'ALT|SHIFT', action = wezterm.action { ActivatePaneDirection = 'Left' } },
    { key = 'l', mods = 'ALT|SHIFT', action = wezterm.action { ActivatePaneDirection = 'Right' } },
    { key = 'k', mods = 'ALT|SHIFT', action = wezterm.action { ActivatePaneDirection = 'Up' } },
    { key = 'j', mods = 'ALT|SHIFT', action = wezterm.action { ActivatePaneDirection = 'Down' } },

    {
      key = 'r',
      mods = 'LEADER',
      action = wezterm.action { ActivateKeyTable = { name = 'resize_pane', one_shot = false, replace_current = true } },
    },
    {
      key = 'a',
      mods = 'LEADER',
      action = wezterm.action {
        ActivateKeyTable = {
          name = 'activate_pane',
          one_shot = true,
          timeout_milliseconds = 1000,
          replace_current = true,
        },
      },
    },

    { key = 's', mods = 'LEADER', action = wezterm.action { Search = { CaseInSensitiveString = '' } } },
    { key = 'y', mods = 'LEADER', action = 'ActivateCopyMode' },
    { key = 'z', mods = 'LEADER', action = 'TogglePaneZoomState' },
    { key = 'Space', mods = 'LEADER', action = 'QuickSelect' },
  },

  key_tables = {
    resize_pane = {
      { key = 'h', action = wezterm.action { AdjustPaneSize = { 'Left', 1 } } },
      { key = 'l', action = wezterm.action { AdjustPaneSize = { 'Right', 1 } } },
      { key = 'k', action = wezterm.action { AdjustPaneSize = { 'Up', 1 } } },
      { key = 'j', action = wezterm.action { AdjustPaneSize = { 'Down', 1 } } },
      { key = 'Escape', action = 'PopKeyTable' },
    },
    activate_pane = {
      { key = 'h', action = wezterm.action { ActivatePaneDirection = 'Left' } },
      { key = 'l', action = wezterm.action { ActivatePaneDirection = 'Right' } },
      { key = 'k', action = wezterm.action { ActivatePaneDirection = 'Up' } },
      { key = 'j', action = wezterm.action { ActivatePaneDirection = 'Down' } },
    },
  },
}
