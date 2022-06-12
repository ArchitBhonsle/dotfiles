local wezterm = require('wezterm');
local catppuccin = require('colors/catppuccin').setup({});

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
  local _ = pane;
  local name = window:active_key_table();
  window:set_right_status(name and "table: " .. name or "");
end);

return {
  colors = catppuccin,
  default_prog = { '/usr/bin/zsh' },
  font_size = 16,

  disable_default_key_bindings = true,
  leader = { mods='CTRL', key='a' },
  keys = {
    -- Leader bindings
    { key='a', mods='LEADER|CTRL', action=wezterm.action{ SendString='\x01' } }, -- Send 'CTRL-A' to the terminal when pressing CTRL-A, CTRL-A

    { key='\\', mods='LEADER', action=wezterm.action{ SplitHorizontal={ domain='CurrentPaneDomain' } } },
    { key='-', mods='LEADER', action=wezterm.action{ SplitVertical={ domain='CurrentPaneDomain' } } },

    { key="r", mods="LEADER", action=wezterm.action{ ActivateKeyTable={ name="resize_pane", one_shot=false } } },
    { key="a", mods="LEADER", action=wezterm.action{ ActivateKeyTable={ name="activate_pane", timeout_milliseconds=1000 } } },
  },

  key_tables = {
    resize_pane = {
      { key="h", action=wezterm.action{ AdjustPaneSize={"Left", 1} } },
      { key="l", action=wezterm.action{ AdjustPaneSize={"Right", 1} } },
      { key="k", action=wezterm.action{ AdjustPaneSize={"Up", 1} } },
      { key="j", action=wezterm.action{ AdjustPaneSize={"Down", 1} } },
      { key="Escape", action="PopKeyTable" },
    },
    activate_pane = {
      { key="h", action=wezterm.action{ ActivatePaneDirection="Left"} },
      { key="l", action=wezterm.action{ ActivatePaneDirection="Right"} },
      { key="k", action=wezterm.action{ ActivatePaneDirection="Up"} },
      { key="j", action=wezterm.action{ ActivatePaneDirection="Down"} },
    },
  }
};
