---------------------------------------------
-- Awesome theme which follows xrdb config --
--   by Yauhen Kirylau                    --
---------------------------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = "Cascadia Code 12"
theme.wallpaper = "~/Pictures/waves.jpg"

-------------------------
theme.wibar_height = dpi(32)
theme.wibar_margin = dpi(0)
theme.wibar_opacity = 0.8;

-- Wibox Background
theme.bg_normal     = "#111111"
theme.bg_focus      = "#222222"
theme.bg_urgent     = "#333333"
theme.bg_minimize   = "#111111"

-- Wibox Foreground
theme.fg_normal     = "#666666"
theme.fg_focus      = "#666666"
theme.fg_urgent     = "#000000"
theme.fg_minimize   = "#444444"

-- Titlebars
theme.titlebar_bg_normal = "#000000"
theme.titlebar_bg_focus  = "#000000"
theme.titlebar_fg_normal = "#ffffff"
theme.titlebar_fg_focus  = "#ffffff"

-- Windows
theme.border_width  = dpi(3)
theme.border_radius = dpi(0)
theme.border_normal  = "#222222"
theme.border_focus = "#00a3cc"
theme.border_marked = "#333333"
theme.useless_gap = dpi(8)
theme.snap_border_width = dpi(4)
theme.snap_border_color = "#333333"

-- hotkeys
theme.hotkeys_font = theme.font
theme.hotkeys_description_font = theme.font
theme.hotkeys_border_width = dpi(3)
theme.hotkeys_border_color = "#333333"
theme.hotkeys_group_margin = dpi(5)

-- mouse menu
theme.menu_height = dpi(28)
theme.menu_width = dpi(300)
-- theme.menu_font = "Dina 9"
theme.menu_border_width = dpi(2)
theme.menu_border_color = "#444444"

-- menubar
theme.menuba_fg_normal = theme.fg_normal
theme.menubar_bg_normal = theme.bg_normal
theme.menubar_border_width = dpi(0)
theme.menubar_border_color = "#333333"
theme.menubar_fg_focus = theme.fg_focus
theme.menubar_bg_focus = theme.bg_focus

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_normal, theme.fg_normal
)

-- Naughty settings
theme.notification_fg = theme.fg_normal
theme.notification_font = theme.font_notifs
theme.notification_icon_size = dpi(45)
theme.notification_border_color = theme.border_focus

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
