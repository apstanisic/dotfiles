local wezterm = require "wezterm"

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "GitHub Dark"
  else
    return "Google (light) (terminal.sexy)"
  end
end

wezterm.on('window-config-reloaded', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

-- local theme = "GruvboxDark (Gogh)"
-- local theme = "GitHub Dark"
local theme = scheme_for_appearance(wezterm.gui.get_appearance())
local theme_scheme = wezterm.color.get_builtin_schemes()[theme]
local theme_bg = wezterm.color.parse(theme_scheme.background)
local theme_fg = wezterm.color.parse(theme_scheme.foreground)

local shortcuts = {
    {
        key = "w",
        mods = "CTRL|SHIFT",
        -- For some reason it does not work to conditionally ask
        -- https://wezfurlong.org/wezterm/config/lua/config/skip_close_confirmation_for_processes_named.html
        action = wezterm.action.CloseCurrentPane {confirm = false}
    },
    -- Open panel to the right
    {
        key = "a",
        mods = "CTRL|ALT",
        action = wezterm.action.SplitPane {
            direction = "Right",
            size = {Percent = 50}
        }
    },
    -- Open panel to the bottom
    {
        key = "z",
        mods = "CTRL|ALT",
        action = wezterm.action.SplitPane {
            direction = "Down",
            size = {Percent = 50}
        }
    }
}
for i = 1, 8 do
    -- ALT + number to select tab
    table.insert(
        shortcuts,
        {
            key = tostring(i),
            mods = "ALT",
            action = wezterm.action.ActivateTab(i - 1)
        }
    )
    -- CTRL+ALT + number to select pane in current tab
    table.insert(
        shortcuts,
        {
            key = tostring(i),
            mods = "CTRL|ALT",
            action = wezterm.action.ActivatePaneByIndex(i - 1)
        }
    )
end

local is_fancy = true

return {
    warn_about_missing_glyphs = false,
    keys = shortcuts,
    -- window_decorations = "RESIZE",
    -- not working
    -- enable_wayland = false,
    -- show opaque
    window_background_opacity = 1.0,
    -- always show scroll bar (there is no dynamic)
    enable_scroll_bar = true,
    -- theme
    color_scheme = theme,
    -- don't show tabs if there is only 1
    -- Always show tabs so that content does not jump when added
    hide_tab_bar_if_only_one_tab = false,
    -- enable tab bar at all
    enable_tab_bar = true,
    -- thin cursor
    --cursor_thickness = "2px",
    default_cursor_style ="SteadyBar",
    -- use prettier tabs
    use_fancy_tab_bar = true,
    tab_bar_at_bottom = false,
    -- only applied if use_fancy_bat_bar = false
    -- tab_max_width = 30,
    -- font to be used
    -- font = wezterm.font "Fira Code",
    font = wezterm.font_with_fallback { "Fira Code Nerd Font Mono", "JetBrainsMono Nerd Font Mono" },
    -- font size
    font_size = 13,
    -- add little space between lines
    line_height = 1.05,
    -- always show cursor 
    hide_mouse_cursor_when_typing = false,
    window_padding = {
        left = 0,
        -- 1 char width, used for displaying scrollbar
        right = "1cell",
        top = 0,
        bottom = 0
    },
}

