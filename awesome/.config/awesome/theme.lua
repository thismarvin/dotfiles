local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
-- local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
-- local xrdb = xresources.get_current_theme()
-- local gfs = require("gears.filesystem")
-- local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = "JetBrains Mono Bold 12"
theme.wallpaper = "~/Pictures/Wallpapers/windows_11_2.jpg"

-------------------------
theme.wibar_height = dpi(48)
theme.wibar_margin = dpi(0)
theme.wibar_opacity = 0.85;

-- Wibox Background
-- theme.bg_normal     = "#1a1b26"
theme.bg_normal = "#222332"
-- theme.bg_focus      = "#1f2335"
theme.bg_focus = "#2a2c3d"
theme.bg_urgent     = "#323449"
theme.bg_minimize   = "#b5bace"

-- Wibox Foreground
theme.fg_normal     = "#545c7e"
theme.fg_focus      = "#5e678d"
theme.fg_urgent     = "#7981a6"
theme.fg_minimize   = "#ff0000"

-- Titlebars
theme.titlebar_bg_normal = "#000000"
theme.titlebar_bg_focus  = "#000000"
theme.titlebar_fg_normal = "#ffffff"
theme.titlebar_fg_focus  = "#ffffff"

-- Windows
theme.border_width  = dpi(6)
theme.border_radius = dpi(0)
theme.border_normal = "#242635"
theme.border_focus = "#00a3cc"
theme.border_marked = "#ff0000"
theme.useless_gap = dpi(2)
theme.snap_border_width = dpi(12)
theme.snap_border_color = "#242635"

-- hotkeys
theme.hotkeys_font = theme.font
theme.hotkeys_description_font = theme.font
theme.hotkeys_border_width = dpi(4)
theme.hotkeys_border_color = "#242635"
theme.hotkeys_group_margin = dpi(8)

-- mouse menu
theme.menu_height = dpi(28)
theme.menu_width = dpi(300)
theme.menu_border_width = dpi(4)
theme.menu_border_color = "#242635"

-- menubar
theme.menuba_fg_normal = theme.fg_normal
theme.menubar_bg_normal = theme.bg_normal
theme.menubar_border_width = dpi(0)
theme.menubar_border_color = "#242635"
theme.menubar_fg_focus = theme.fg_focus
theme.menubar_bg_focus = theme.bg_focus

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, "#1a1b26", theme.fg_normal
)

-- Naughty settings
-- theme.notification_fg = theme.fg_normal
-- theme.notification_bg = "#ff0000"
-- theme.notification_font = theme.font_notifs
-- theme.notification_icon_size = dpi(45)
-- theme.notification_border_color = theme.border_focus
-- theme.notification_margin = dpi(8)
-- theme.notification_border_width = dpi(16)
theme.notification_spacing = dpi(32)

theme.systray_icon_spacing = dpi(4)

-- mstab
theme.mstab_bar_ontop = false               -- whether you want to allow the bar to be ontop of clients
theme.mstab_dont_resize_slaves = true      -- whether the tabbed stack windows should be smaller than the
                                            -- currently focused stack window (set it to true if you use
                                            -- transparent terminals. False if you use shadows on solid ones
theme.mstab_bar_padding = "default"         -- how much padding there should be between clients and your tabbar
                                            -- by default it will adjust based on your useless gaps.
                                            -- If you want a custom value. Set it to the number of pixels (int)
theme.mstab_border_radius = 0               -- border radius of the tabbar
theme.mstab_bar_height = dpi(32)                 -- height of the tabbar
theme.mstab_tabbar_position = "bottom"         -- position of the tabbar (mstab currently does not support left,right)
theme.mstab_tabbar_style = "boxes"        -- style of the tabbar ("default", "boxes" or "modern")
                                            -- defaults to the tabbar_style so only change if you want a
                                            -- different style for mstab and tabbed

theme.tag_preview_widget_border_radius = 0          -- Border radius of the widget (With AA)
theme.tag_preview_client_border_radius = 0          -- Border radius of each client in the widget (With AA)
theme.tag_preview_client_opacity = 1              -- Opacity of each client
theme.tag_preview_client_bg = "#1a1b26"             -- The bg color of each client
theme.tag_preview_client_border_color = "#242635"   -- The border color of each client
theme.tag_preview_client_border_width = dpi(4)           -- The border width of each client
theme.tag_preview_widget_bg = "#0a0a0f"             -- The bg color of the widget
theme.tag_preview_widget_border_color = "#00a3cc"   -- The border color of the widget
theme.tag_preview_widget_border_width = dpi(4)           -- The border width of the widget
theme.tag_preview_widget_margin = dpi(16)                 -- The margin of the widget

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
