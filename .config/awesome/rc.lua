-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- TODO:
-- get rid of bling?

-- @DOC_REQUIRE_SECTION@
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- ?????????????????????????????????
-- local bling = require("bling");

local display_width = 2560;
local display_height = 1080;

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
-- @DOC_ERROR_HANDLING@
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification {
		urgency = "critical",
		title = "Oops, an error happened"..(startup and " during startup!" or "!"),
		message = message
	}
end)
-- }}}

-- {{{ Variable definitions
-- @DOC_LOAD_THEME@
-- Themes define colours, icons, font and wallpapers.
beautiful.init(".config/awesome/theme.lua")

-- @DOC_DEFAULT_APPLICATIONS@
-- This is used later as the default terminal and editor to run.
terminal = "kitty"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
-- }}}

-- {{{ Menu
-- @DOC_MENU@
-- Create a launcher widget and a main menu
myawesomemenu = {
	{ "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{ "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({
	items = {
		{ "awesome", myawesomemenu, beautiful.awesome_icon },
		{ "open terminal", terminal }
  }
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Tag
-- @DOC_LAYOUT@
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
	awful.layout.append_default_layouts({
			awful.layout.suit.fair,
			awful.layout.suit.floating,

			-- awful.layout.suit.floating,
			-- awful.layout.suit.tile,
			-- awful.layout.suit.max,
			-- awful.layout.suit.tile.left,
			-- awful.layout.suit.tile.bottom,
			-- awful.layout.suit.tile.top,
			-- awful.layout.suit.fair,
			-- awful.layout.suit.fair.horizontal,
			-- awful.layout.suit.spiral,
			-- awful.layout.suit.spiral.dwindle,
			-- awful.layout.suit.max.fullscreen,
			-- awful.layout.suit.magnifier,
			-- awful.layout.suit.corner.nw,
	})
end)
-- }}}

-- {{{ Wibar

-- -- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()

-- @DOC_WALLPAPER@
screen.connect_signal("request::wallpaper", function(s)
	-- Wallpaper
	if beautiful.wallpaper then
			local wallpaper = beautiful.wallpaper
			-- If wallpaper is a function, call it with the screen
			if type(wallpaper) == "function" then
				wallpaper = wallpaper(s)
			end
			gears.wallpaper.maximized(wallpaper, s, true)
	end
end)

-- @DOC_FOR_EACH_SCREEN@
screen.connect_signal("request::desktop_decoration", function(s)
	-- Each screen has its own tag table.
	-- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
	awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

	-- -- Create a promptbox for each screen
	-- s.mypromptbox = awful.widget.prompt()

	-- -- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- -- We need one layoutbox per screen.
	-- s.mylayoutbox = awful.widget.layoutbox {
	--     screen  = s,
	--     buttons = {
	--         awful.button({ }, 1, function () awful.layout.inc( 1) end),
	--         awful.button({ }, 3, function () awful.layout.inc(-1) end),
	--         awful.button({ }, 4, function () awful.layout.inc(-1) end),
	--         awful.button({ }, 5, function () awful.layout.inc( 1) end),
	--     },
	-- }

	local wibar_height = 24;

    -- Create a taglist widget
	s.mytaglist = awful.widget.taglist {
	screen = s,
	filter = awful.widget.taglist.filter.all,
		buttons = {
			awful.button({}, 1, function(t) t:view_only() end),
			awful.button({ modkey }, 1, function(t)
				if client.focus then
						client.focus:move_to_tag(t)
				end
			end),
			awful.button({}, 3, awful.tag.viewtoggle),
			awful.button({ modkey }, 3, function(t)
				if client.focus then
						client.focus:toggle_tag(t)
				end
			end),
			awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
			awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
			},
			layout = {
				spacing = 2,
				spacing_widget = {
					widget = wibox.widget.separator,
				},
				layout  = wibox.layout.fixed.horizontal
			},
			widget_template = {
				{
					{
						id = "text_role",
						widget = wibox.widget.textbox,
					},
					left = 8,
					widget = wibox.container.margin
				},
				id = 'background_role',
				forced_width = wibar_height,
				forced_height = wibar_height,
				widget = wibox.container.background,
			}
    }

	-- -- @TASKLIST_BUTTON@
	-- -- Create a tasklist widget
	-- s.mytasklist = awful.widget.tasklist {
	-- 	screen = s,
	-- 	filter  = awful.widget.tasklist.filter.currenttags,
	-- 	buttons = {
	-- 			awful.button({}, 1, function (c)
	-- 				c:activate { context = "tasklist", action = "toggle_minimization" }
	-- 			end),
	-- 			awful.button({}, 3, function () awful.menu.client_list { theme = { width = 250 } } end),
	-- 			awful.button({}, 4, function () awful.client.focus.byidx(-1) end),
	-- 			awful.button({}, 5, function () awful.client.focus.byidx( 1) end),
	-- 	},
	-- 	layout = {
	-- 		spacing = 2,
	-- 		spacing_widget = {
	-- 			widget = wibox.widget.separator,
	-- 		},
	-- 		layout  = wibox.layout.flex.horizontal
	-- 	},
	-- 	widget_template = {
	-- 		{
	-- 			{
	-- 				id = "text_role",
	-- 				widget = wibox.widget.textbox,
	-- 			},
	-- 			left = 8,
	-- 			right = 8,
	-- 			widget = wibox.container.margin
	-- 		},
	-- 		id = 'background_role',
	-- 		widget = wibox.container.background,
	-- 	}
	-- }

	s.mytext_clock = wibox.widget {
		format = "%R",
		widget = wibox.widget.textclock
	}

	-- @DOC_WIBAR@
	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "top",
		screen = s
	})

	-- @DOC_SETUP_WIDGETS@
	-- Add widgets to the wibox
	s.mywibox.widget = {
		{
			s.mytaglist,
			halign = "left",
			widget = wibox.container.place,
		},
		{
			 s.mytext_clock,
			 halign = "center",
			 widget = wibox.container.place
		},
		{
			wibox.widget.systray(),
			halign = "right",
			forced_width = wibar_height * 5 + 2 * (5 - 1),
			widget = wibox.container.place,
		},
		layout = wibox.layout.align.horizontal,
	}
end)
-- }}}

-- {{{ Mouse bindings
-- @DOC_ROOT_BUTTONS@
awful.mouse.append_global_mousebindings({
	awful.button({}, 3, function () mymainmenu:toggle() end),
	awful.button({}, 4, awful.tag.viewprev),
	awful.button({}, 5, awful.tag.viewnext),
})
-- }}}

-- {{{ Key bindings
-- @DOC_GLOBAL_KEYBINDINGS@

-- Custom keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "apostrophe", function () awful.spawn(terminal) end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey }, "s", function () awful.spawn.with_shell("kitty --class=launcher -e /usr/bin/sway-launcher-desktop") end, { description = "open an applicatin launcher", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "s", function () awful.spawn("flameshot gui") end, { description = "take a screen shot", group = "launcher" }),
	awful.key({ modkey }, "semicolon", function () awful.spawn("rofimoji") end, { description = "open emoji picker", group = "launcher" }),
	awful.key({ modkey }, "c", function () awful.spawn("qalculate-gtk") end, { description = "open calculator", group = "launcher" }),
})

-- General Awesome keys
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "slash", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "e", awesome.quit, { description = "quit awesome", group = "awesome" }),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "j",
		function ()
			awful.client.focus.byidx( 1)
		end,
		{ description = "focus next by index", group = "client" }
	),
	awful.key({ modkey }, "k",
		function ()
			awful.client.focus.byidx(-1)
		end,
		{ description = "focus previous by index", group = "client" }
	),
	awful.key({ modkey }, "Tab",
		function ()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end,
		{ description = "go back", group = "client" }
	),
	awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "n",
		function ()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:activate { raise = true, context = "key.unminimize" }
			end
		end,
		{ description = "restore minimized", group = "client" }),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Shift" }, "j", function () awful.client.swap.byidx(  1) end, { description = "swap with next client by index", group = "client" }),
    awful.key({ modkey, "Shift" }, "k", function () awful.client.swap.byidx( -1) end, { description = "swap with previous client by index", group = "client" }),
    awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
    awful.key({ modkey }, "l", function () awful.tag.incmwfact( 0.05) end, { description = "increase master width factor", group = "layout" }),
    awful.key({ modkey }, "h", function () awful.tag.incmwfact(-0.05) end, { description = "decrease master width factor", group = "layout" }),
    awful.key({ modkey, "Shift" }, "h", function () awful.tag.incnmaster( 1, nil, true) end, { description = "increase the number of master clients", group = "layout" }),
    awful.key({ modkey, "Shift" }, "l", function () awful.tag.incnmaster(-1, nil, true) end, { description = "decrease the number of master clients", group = "layout" }),
    awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol( 1, nil, true) end, { description = "increase the number of columns", group = "layout" }),
    awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1, nil, true) end, { description = "decrease the number of columns", group = "layout" }),
    awful.key({ modkey }, "space", function () awful.layout.inc(1) end, { description = "select next", group = "layout" }),
    awful.key({ modkey, "Shift" }, "space", function () awful.layout.inc(-1) end, { description = "select previous", group = "layout" }),
})

-- @DOC_NUMBER_KEYBINDINGS@
awful.keyboard.append_global_keybindings({
	awful.key {
		modifiers = { modkey },
		keygroup = "numrow",
		description = "only view tag",
		group = "tag",
		on_press = function (index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
	},
	awful.key {
		modifiers = { modkey, "Control" },
		keygroup = "numrow",
		description = "toggle tag",
		group = "tag",
		on_press = function (index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end,
	},
	awful.key {
			modifiers = { modkey, "Shift" },
			keygroup = "numrow",
			description = "move focused client to tag",
			group = "tag",
			on_press = function (index)
				if client.focus then
					local tag = client.focus.screen.tags[index]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
	},
	awful.key {
		modifiers = { modkey, "Control", "Shift" },
		keygroup = "numrow",
		description = "toggle focused client on tag",
		group = "tag",
		on_press = function (index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end,
	},
	awful.key {
		modifiers = { modkey },
		keygroup = "numpad",
		description = "select layout directly",
		group = "layout",
		on_press = function (index)
			local t = awful.screen.focused().selected_tag
			if t then
				t.layout = t.layouts[index] or t.layout
			end
		end,
	}
})

-- @DOC_CLIENT_BUTTONS@
client.connect_signal("request::default_mousebindings", function ()
	awful.mouse.append_client_mousebindings({
		awful.button({}, 1, function (c)
			c:activate { context = "mouse_click" }
		end),
		awful.button({ modkey }, 1, function (c)
			c:activate { context = "mouse_click", action = "mouse_move" }
		end),
		awful.button({ modkey }, 3, function (c)
			c:activate { context = "mouse_click", action = "mouse_resize" }
		end),
	})
end)

-- @DOC_CLIENT_KEYBINDINGS@
client.connect_signal("request::default_keybindings", function ()
	awful.keyboard.append_client_keybindings({
		awful.key({ modkey }, "f",
			function (c)
				c.fullscreen = not c.fullscreen
				c:raise()
			end,
			{ description = "toggle fullscreen", group = "client" }
		),
		awful.key({ modkey, "Shift" }, "q", function (c) c:kill() end, { description = "close", group = "client" }),
		awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle ,{ description = "toggle floating", group = "client" }),
		awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end, { description = "move to master", group = "client" }),
		awful.key({ modkey }, "o", function (c) c:move_to_screen() end, { description = "move to screen", group = "client" }),
		awful.key({ modkey }, "t", function (c) c.ontop = not c.ontop end, { description = "toggle keep on top", group = "client" }),
		awful.key({ modkey }, "n",
			function (c)
				-- The client currently has the input focus, so it cannot be
				-- minimized, since minimized clients can't have the focus.
				c.minimized = true
			end,
			{description = "minimize", group = "client" }
		),
		awful.key({ modkey }, "m",
			function (c)
				c.maximized = not c.maximized
				c:raise()
			end,
			{ description = "(un)maximize", group = "client" }
		),
		awful.key({ modkey, "Control" }, "m",
			function (c)
				c.maximized_vertical = not c.maximized_vertical
				c:raise()
			end,
			{ description = "(un)maximize vertically", group = "client" }
		),
		awful.key({ modkey, "Shift" }, "m",
			function (c)
				c.maximized_horizontal = not c.maximized_horizontal
				c:raise()
			end,
			{ description = "(un)maximize horizontally", group = "client" }
		),
		-- awful.key({ modkey }, "i",
		-- 	function (c)
		-- 		local launcher_yeet = function (c)
		-- 			return awful.rules.match(c, { class = "launcher" })
		-- 		end
		-- 		for c in awful.client.iterate(launcher_yeet) do
		-- 			c.x = 32
		-- 			c.y = 32
		-- 		end
		-- 	end,
		-- 	{ description = "yeet", group = "client" }
		-- ),
	})
end)
-- }}}


-- {{{ Rules
-- Rules to apply to new clients.
-- @DOC_RULES@
ruled.client.connect_signal("request::rules", function ()
	-- @DOC_GLOBAL_RULE@
	-- All clients will match this rule.
	ruled.client.append_rule {
		id = "global",
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.centered
		}
	}

	-- @DOC_FLOATING_RULE@
	-- Floating clients.
	ruled.client.append_rule {
		id = "floating",
		rule_any = {
			instance = { "copyq", "pinentry" },
			class = {
				"Arandr", "Blueman-manager", "Gpick", "Kruler", "Thunar", "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
			},
			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			}
		},
		properties = { floating = true }
	}

	-- @DOC_DIALOG_RULE@
	-- Add titlebars to normal clients and dialogs
	ruled.client.append_rule {
		-- @DOC_CSD_TITLEBARS@
		id = "titlebars",
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = false }
	}

	ruled.client.append_rule {
		rule = { class = "kitty" },
		properties = {
			x = (display_width - 1080) / 2,
			y = (display_height - 800) / 2,
			width = 1080,
			height = 800
		}
	}

	ruled.client.append_rule {
		rule = { class = "Sxiv" },
		properties = {
			floating = true,
			x = (display_width - 1080) / 2,
			y = (display_height - 800) / 2,
			width = 1080,
			height = 800
		}
	}

	-- ruled.client.append_rule {
	-- 	rule = { class = "firefox" },
	-- 	properties = {
	-- 		titlebars_enabled = true
	-- 	}
	-- }

	ruled.client.append_rule {
		rule = { class = "Steam" },
		properties = {
			floating = true,
			width = 1500,
			height = 800
		}
	}

	ruled.client.append_rule {
		rule = { class = "Qalculate-gtk" },
		properties = {
			floating = true,
			width = 500,
			height = 500
		}
	}

	ruled.client.append_rule {
		rule = { class = "Pop" },
		properties = {
			floating = true,
		}
	}

	ruled.client.append_rule {
		rule = { class = "Pavucontrol" },
		properties = {
			floating = true,
			width = 550,
			height = 800
		}
	}

	ruled.client.append_rule {
		rule = { class = "Joplin" },
		properties = {
			floating = true,
			-- titlebars_enabled = true,
			x = (display_width - 1500) / 2,
			y = (display_height - 1000) / 2,
			width = 1500,
			height = 1000,
		}
	}

	ruled.client.append_rule {
		rule = { class = "launcher" },
		properties = {
			floating = true,
			titlebars_enabled = false,
			x = (display_width - 500) / 2,
			y = (display_height - 800) / 2,
			width = 500,
			height = 800
		}
	}
end)

-- }}}

-- {{{ Titlebars
-- @DOC_TITLEBARS@
-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function (c)
	local top_titlebar = awful.titlebar(c, {
			size = 24,
	})

	-- buttons for the titlebar
	local buttons = {
		awful.button({}, 1, function ()
				c:activate { context = "titlebar", action = "mouse_move" }
		end),
	}

	top_titlebar : setup {
		{ -- Left
			layout  = wibox.layout.fixed.horizontal
		},
		{ -- Middle
			{ -- Title
				align = "center",
				widget = awful.titlebar.widget.titlewidget(c)
			},
			buttons = buttons,
			layout  = wibox.layout.flex.horizontal
		},
		{ -- Right
			layout = wibox.layout.fixed.horizontal()
		},
		layout = wibox.layout.align.horizontal
	}

end)

-- {{{ Notifications
ruled.notification.connect_signal('request::rules', function ()
	-- All notifications will match this rule.
	ruled.notification.append_rule {
		rule = {},
		properties = {
			screen = awful.screen.preferred,
			implicit_timeout = 5,
		}
	}
end)

naughty.connect_signal("request::display", function (n)
	naughty.layout.box { notification = n }
end)
-- }}}

-- -- Enable sloppy focus, so that focus follows mouse.
-- client.connect_signal("mouse::enter", function (c)
-- 	c:activate { context = "mouse_enter", raise = false }
-- end)
