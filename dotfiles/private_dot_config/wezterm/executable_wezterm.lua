local wezterm = require "wezterm"

function get_theme(appearance)
    if appearance:find "Dark" then
        return "GitHub Dark"
    else
        -- TODO Figure out why it's always light theme
        return "GitHub Dark"
        -- Do not use github light here, since yellow is illegible
        -- return "Google Light (base16)"
    end
end

return {
    -- Join title bar and tabs (like in browsers)
    window_decorations = "INTEGRATED_BUTTONS|RESIZE",
    -- Use Gnome style buttons in top right corner
    integrated_title_button_style = "Gnome",
    -- Tab bar
    window_frame = {
        -- increase size of tabs a little
        font_size = 13
    },
    -- Notification is distracting. Showing in AstroNvim
    warn_about_missing_glyphs = false,
    -- theme
    color_scheme = get_theme(wezterm.gui.get_appearance()),
    -- Always show tabs so that content does not jump when added
    hide_tab_bar_if_only_one_tab = false,
    -- enable tab bar at all
    enable_tab_bar = true,
    -- font to be used, with fallback if font does not exist
    font = wezterm.font_with_fallback {
        "JetBrainsMono Nerd Font",
        "FiraCode Nerd Font",
        "Fira Code"
    },
    -- font size
    font_size = 13,
    -- add little space between lines for easier reading
    line_height = 1.15,
    -- always show cursor
    hide_mouse_cursor_when_typing = false,
    -- always show scroll bar (there is no dynamic)
    enable_scroll_bar = true,
    keys = {
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
        },
        {key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0)},
        {key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1)},
        {key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2)},
        {key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3)},
        {key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4)},
        {key = "6", mods = "ALT", action = wezterm.action.ActivateTab(5)},
        {key = "7", mods = "ALT", action = wezterm.action.ActivateTab(6)},
        {key = "8", mods = "ALT", action = wezterm.action.ActivateTab(7)},
        {key = "9", mods = "ALT", action = wezterm.action.ActivateTab(8)},
        {key = "1", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneByIndex(0)},
        {key = "2", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneByIndex(1)},
        {key = "3", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneByIndex(2)},
        {key = "4", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneByIndex(3)},
        {key = "5", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneByIndex(4)},
        {key = "6", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneByIndex(5)},
        {key = "7", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneByIndex(6)},
        {key = "8", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneByIndex(7)},
        {key = "9", mods = "CTRL|ALT", action = wezterm.action.ActivatePaneByIndex(8)}
    }
}

