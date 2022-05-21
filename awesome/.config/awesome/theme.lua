local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")

local dpi = xresources.apply_dpi

local theme = {}

theme.font = "JetBrains Mono Bold 10"

-- Wibar.
theme.wibar_height = dpi(24)

-- Wibox Background.
theme.bg_normal = "#000000"
theme.bg_focus = "#0000ff"
theme.bg_urgent = "#ff0000"
theme.bg_minimize = "#000000"

-- Wibox Foreground.
theme.fg_normal = "#ffffff"
theme.fg_focus = "#ffffff"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#ffffff"

-- Titlebars.
theme.titlebar_bg_normal = "#000000"
theme.titlebar_bg_focus = "#000000"
theme.titlebar_fg_normal = "#565f89"
theme.titlebar_fg_focus = "#c0caf5"

-- Windows.
theme.border_width = dpi(2)
theme.border_radius = dpi(0)
theme.border_normal = "#242635"
theme.border_focus = "#00a3cc"
theme.border_marked = "#ff0000"
theme.useless_gap = dpi(2)
theme.snap_border_width = dpi(12)
theme.snap_border_color = "#242635"

-- Hotkeys.
theme.hotkeys_bg = "#000000"
theme.hotkeys_fg = "#ffffff"
theme.hotkeys_border_width = dpi(4)
theme.hotkeys_border_color = "#00a3cc"
-- theme.hotkeys_shape
theme.hotkeys_modifiers_fg = "#c0caf5"
theme.hotkeys_label_bg = "#242635"
theme.hotkeys_label_fg = "#ffffff"
theme.hotkeys_font = "JetBrains Mono Bold 12"
theme.hotkeys_description_font = "JetBrains Mono Bold 12"
-- theme.hotkeys_group_margin

-- Mouse Menu.
theme.menu_height = dpi(24)
theme.menu_width = dpi(300)
theme.menu_border_width = dpi(4)
theme.menu_border_color = "#242635"

-- Menubar.
theme.menubar_fg_normal = theme.fg_normal
theme.menubar_bg_normal = theme.bg_normal
theme.menubar_border_width = dpi(0)
theme.menubar_border_color = "#242635"
theme.menubar_fg_focus = theme.fg_focus
theme.menubar_bg_focus = theme.bg_focus

-- Generate Awesome icon.
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, "#000000", theme.fg_normal)

-- Naughty settings.
theme.notification_font = theme.font_notifs
theme.notification_bg = "#000000"
theme.notification_fg = "#ffffff"
-- theme.notification_border_width
theme.notification_border_color = "#ffffff"
-- theme.notification_shape
-- theme.notification_opacity
-- theme.notification_margin
-- theme.notification_width
-- theme.notification_height
theme.notification_spacing = dpi(16)

theme.systray_icon_spacing = dpi(2)

-- mstab.
theme.mstab_bar_ontop = true
theme.mstab_dont_resize_slaves = true
theme.mstab_bar_padding = "default"
theme.mstab_border_radius = 0
theme.mstab_bar_height = dpi(12)
theme.mstab_tabbar_position = "top"
theme.mstab_tabbar_style = "default"

return theme
