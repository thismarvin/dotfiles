-- If LuaRocks is installed, make sure that packages installed through it are found (e.g. lgi). If
-- LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local bling = require("bling")

require("awful.autofocus")

-- Error handling.
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgency = "critical",
		title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
		message = message,
	})
end)

beautiful.init(".config/awesome/theme.lua")

local terminal = os.getenv("TERMINAL") or "xterm"
local editor = os.getenv("EDITOR") or "vim"
local editor_cmd = terminal .. " -e " .. editor

local modkey = "Mod4"

local display_width = 2560
local display_height = 1080

local my_awesome_menu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

local my_main_menu = awful.menu({
	items = {
		{ "awesome", my_awesome_menu, beautiful.awesome_icon },
		{ "open terminal", terminal },
	},
})

menubar.utils.terminal = terminal

-- Table of layouts to cover with awful.layout.inc (order matters).
tag.connect_signal("request::default_layouts", function()
	awful.layout.append_default_layouts({
		awful.layout.suit.floating,
		bling.layout.deck,

		-- bling.layout.mstab,
		-- bling.layout.centered,
		-- bling.layout.vertical,
		-- bling.layout.horizontal,
		-- bling.layout.equalarea,
		-- bling.layout.deck,

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

screen.connect_signal("request::wallpaper", function()
	gears.wallpaper.set("#000000")
end)

screen.connect_signal("request::desktop_decoration", function(s)
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, {
		bling.layout.deck,
		bling.layout.deck,
		awful.layout.suit.fair,
		awful.layout.suit.fair,
		awful.layout.suit.floating,
		awful.layout.suit.floating,
		awful.layout.suit.floating,
		awful.layout.suit.floating,
		awful.layout.suit.floating,
	})

	s.my_tag_list = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.noempty,
		buttons = {
			awful.button({}, 1, function(t)
				t:view_only()
			end),
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
			awful.button({}, 4, function(t)
				awful.tag.viewprev(t.screen)
			end),
			awful.button({}, 5, function(t)
				awful.tag.viewnext(t.screen)
			end),
		},
		widget_template = {
			{
				{
					id = "index_role",
					widget = wibox.widget.textbox,
				},
				left = -2,
				right = -2,
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
			create_callback = function(self, c3, _, _)
				self:get_children_by_id("index_role")[1].markup = "<b> " .. c3.index .. " </b>"
			end,
		},
	})

	s.my_text_clock = wibox.widget({
		{
			format = "%F::%R",
			widget = wibox.widget.textclock,
		},
		left = 8,
		right = 8,
		widget = wibox.container.margin,
	})

	-- Create the wibox.
	s.my_wibox = awful.wibar({
		position = "bottom",
		screen = s,
	})

	-- Add widgets to the wibox.
	s.my_wibox.widget = {
		s.my_tag_list,
		{
			widget = wibox.container.background,
		},
		{
			wibox.widget.systray(),
			s.my_text_clock,
			layout = wibox.layout.fixed.horizontal,
		},
		layout = wibox.layout.align.horizontal,
	}
end)

-- Mouse bindings.
awful.mouse.append_global_mousebindings({
	awful.button({}, 3, function()
		my_main_menu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewprev),
	awful.button({}, 5, awful.tag.viewnext),
})

-- Custom keybindings.
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "Return", function()
		awful.spawn(terminal)
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey }, "s", function()
		awful.spawn.with_shell([[kitty --class=launcher bash "/usr/bin/sway-launcher-desktop"]])
	end, { description = "open an application launcher", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "s", function()
		awful.spawn("flameshot gui")
	end, { description = "take a screen shot", group = "launcher" }),
	awful.key({ modkey }, "semicolon", function()
		awful.spawn("rofimoji")
	end, { description = "open emoji picker", group = "launcher" }),
	awful.key({ modkey }, "e", function()
		awful.spawn("thunar")
	end, { description = "open file explorer", group = "launcher" }),
	awful.key({ modkey }, "c", function()
		awful.spawn("qalculate-gtk")
	end, { description = "open calculator", group = "launcher" }),
})

-- General Awesome keys.
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "slash", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "e", awesome.quit, { description = "quit awesome", group = "awesome" }),
})

local function delete_tag()
	local t = awful.screen.focused().selected_tag
	if not t then
		return
	end
	t:delete()
end

local function add_tag()
	awful.tag.add("tag", {
		screen = awful.screen.focused(),
		layout = awful.layout.layouts[1],
	}):view_only()
end

-- Tags related keybindings.
awful.keyboard.append_global_keybindings({
	awful.key({ modkey, "Shift" }, "j", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey, "Shift" }, "k", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "a", add_tag, { description = "create a new tag", group = "tag" }),
	awful.key({ modkey, "Shift" }, "a", delete_tag, { description = "delete the current tag", group = "tag" }),
})

-- Focus related keybindings.
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "l", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "h", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:activate({ raise = true, context = "key.unminimize" })
		end
	end, { description = "restore minimized", group = "client" }),
})

-- Layout related keybindings.
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),
})

awful.keyboard.append_global_keybindings({
	awful.key({
		modifiers = { modkey },
		keygroup = "numrow",
		description = "only view tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Control" },
		keygroup = "numrow",
		description = "toggle tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Shift" },
		keygroup = "numrow",
		description = "move focused client to tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Control", "Shift" },
		keygroup = "numrow",
		description = "toggle focused client on tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end,
	}),
})

client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings({
		awful.button({}, 1, function(c)
			c:activate({ context = "mouse_click" })
		end),
		awful.button({ modkey }, 1, function(c)
			c:activate({ context = "mouse_click", action = "mouse_move" })
		end),
		awful.button({ modkey }, 3, function(c)
			c:activate({ context = "mouse_click", action = "mouse_resize" })
		end),
	})
end)

client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		awful.key({ modkey }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "toggle fullscreen", group = "client" }),
		awful.key({ modkey, "Shift" }, "q", function(c)
			c:kill()
		end, { description = "close", group = "client" }),
		awful.key(
			{ modkey, "Control" },
			"space",
			awful.client.floating.toggle,
			{ description = "toggle floating", group = "client" }
		),
		awful.key({ modkey, "Control" }, "Return", function(c)
			c:swap(awful.client.getmaster())
		end, { description = "move to master", group = "client" }),
		awful.key({ modkey }, "o", function(c)
			c:move_to_screen()
		end, { description = "move to screen", group = "client" }),
		awful.key({ modkey }, "t", function(c)
			c.ontop = not c.ontop
		end, { description = "toggle keep on top", group = "client" }),
		awful.key({ modkey }, "n", function(c)
			-- The client currently has the input focus, so it cannot be
			-- minimized, since minimized clients can't have the focus.
			c.minimized = true
		end, { description = "minimize", group = "client" }),
		awful.key({ modkey }, "m", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, { description = "(un)maximize", group = "client" }),
		awful.key({ modkey, "Control" }, "m", function(c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end, { description = "(un)maximize vertically", group = "client" }),
		awful.key({ modkey, "Shift" }, "m", function(c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end, { description = "(un)maximize horizontally", group = "client" }),
	})
end)

-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
	-- All clients will match this rule.
	ruled.client.append_rule({
		id = "global",
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.centered,
		},
	})

	-- Floating clients.
	ruled.client.append_rule({
		id = "floating",
		rule_any = {
			instance = {
				"copyq",
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"Pop",
				"Qalculate-gtk",
				"Tor Browser",
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},
			-- Note that the name property shown in xprop might be set slightly after creation of the
			-- client and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	})

	-- Add titlebars to normal clients and dialogs.
	ruled.client.append_rule({
		id = "titlebars",
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = true },
	})

	ruled.client.append_rule({
		rule = { class = "kitty" },
		properties = {
			x = (display_width - 1080) / 2,
			y = (display_height - 800) / 2,
			width = 1080,
			height = 800,
		},
	})

	ruled.client.append_rule({
		rule = { class = "firefox" },
		properties = {
			tag = screen[1].tags[2],
		},
	})

	ruled.client.append_rule({
		rule = { class = "dev" },
		properties = {
			floating = true,
			x = display_width * 0.5,
			y = 2,
			width = display_width * 0.5 - 4,
			height = display_height - 4 - 24,
		},
	})

	ruled.client.append_rule({
		rule = { class = "btm" },
		properties = {
			tag = screen[1].tags[3],
			titlebars_enabled = false,
		},
	})

	ruled.client.append_rule({
		rule_any = {
			class = {
				"Element",
				"Jitsi Meet",
			},
		},
		properties = {
			tag = screen[1].tags[4],
		},
	})

	ruled.client.append_rule({
		rule = { class = "Pavucontrol" },
		properties = {
			floating = true,
			width = 600,
			height = 800,
		},
	})

	ruled.client.append_rule({
		rule = { class = "launcher" },
		properties = {
			floating = true,
			titlebars_enabled = false,
			x = (display_width - 500) / 2,
			y = (display_height - 800) / 2,
			width = 500,
			height = 800,
		},
	})
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	local top_titlebar = awful.titlebar(c, {
		size = 24,
	})

	-- Buttons for the titlebar
	local buttons = {
		awful.button({}, 1, function()
			c:activate({ context = "titlebar", action = "mouse_move" })
		end),
	}

	top_titlebar:setup({
		{ -- Left
			left = 8,
			widget = wibox.container.margin,
		},
		{ -- Middle
			{ -- Title
				align = "left",
				widget = awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal,
		},
		{ -- Right
			layout = wibox.layout.fixed.horizontal,
		},
		layout = wibox.layout.align.horizontal,
	})
end)

ruled.notification.connect_signal("request::rules", function()
	-- All notifications will match this rule.
	ruled.notification.append_rule({
		rule = {},
		properties = {
			screen = awful.screen.preferred,
			implicit_timeout = 5,
		},
	})
end)

naughty.connect_signal("request::display", function(n)
	naughty.layout.box({ notification = n })
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:activate({ context = "mouse_enter", raise = false })
end)
