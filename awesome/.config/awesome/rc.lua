-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

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

-- local xresources = require("beautiful.xresources")

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

local bling = require("bling")

-- bling.module.flash_focus.enable()

local bling_preview_scale = 0.2

bling.widget.tag_preview.enable {
	show_client_content = true,  -- Whether or not to show the client content
	-- x = 10,                       -- The x-coord of the popup
	-- y = 10,                       -- The y-coord of the popup
	scale = bling_preview_scale,                 -- The scale of the previews compared to the screen
	honor_padding = false,        -- Honor padding when creating widget size
	honor_workarea = false,       -- Honor work area when creating widget size
	placement_fn = function(c)    -- Place the widget using awful.placement (this overrides x & y)
		awful.placement.top_left(c, {
			margins = {
				left = (display_width - display_width * bling_preview_scale) * 0.5,
				top = (display_height - display_height * bling_preview_scale - display_height * 0.106)
			}
		})
	end
}

-- @DOC_DEFAULT_APPLICATIONS@
-- This is used later as the default terminal and editor to run.
local terminal = os.getenv("TERMINAL") or "xterm"
local editor = os.getenv("EDITOR") or "vim"
local editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
local modkey = "Mod4"
-- }}}

-- {{{ Menu
-- @DOC_MENU@
-- Create a launcher widget and a main menu
local myawesomemenu = {
	{ "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{ "quit", function() awesome.quit() end },
}

local mymainmenu = awful.menu({
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
			-- awful.layout.suit.fair,
			-- awful.layout.suit.floating,

			bling.layout.mstab,
			-- bling.layout.equalarea,
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
			-- local wallpaper = beautiful.wallpaper
			-- -- If wallpaper is a function, call it with the screen
			-- if type(wallpaper) == "function" then
			-- 	wallpaper = wallpaper(s)
			-- end
			-- gears.wallpaper.maximized(wallpaper, s, false, { x = 0, y = 0 })

			gears.wallpaper.set("#008080")
	end
end)

-- @DOC_FOR_EACH_SCREEN@
screen.connect_signal("request::desktop_decoration", function(s)
	-- Each screen has its own tag table.
	-- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
	awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

	-- awful.tag.add("dev", {
	-- 		-- icon               = "/path/to/icon1.png",
	-- 		layout             = awful.layout.suit.tile,
	-- 		master_fill_policy = "master_width_factor",
	-- 		gap_single_client  = true,
	-- 		gap                = xresources.apply_dpi(2),
	-- 		screen             = s,
	-- 		selected           = true,
	-- })

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

 --  -- Create a taglist widget
	-- s.mytaglist = awful.widget.taglist {
	-- 	screen = s,
	-- 	filter = awful.widget.taglist.filter.all,
	-- 	buttons = {
	-- 		awful.button({}, 1, function(t) t:view_only() end),
	-- 		awful.button({ modkey }, 1, function(t)
	-- 			if client.focus then
	-- 					client.focus:move_to_tag(t)
	-- 			end
	-- 		end),
	-- 		awful.button({}, 3, awful.tag.viewtoggle),
	-- 		awful.button({ modkey }, 3, function(t)
	-- 			if client.focus then
	-- 					client.focus:toggle_tag(t)
	-- 			end
	-- 		end),
	-- 		awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
	-- 		awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
	-- 		},
	-- 	layout = {
	-- 		spacing = 2,
	-- 		spacing_widget = {
	-- 			widget = wibox.widget.separator,
	-- 		},
	-- 		layout  = wibox.layout.fixed.horizontal
	-- 	},
	-- 	widget_template = {
	-- 		{
	-- 			{
	-- 				id = "text_role",
	-- 				widget = wibox.widget.textbox,
	-- 			},
	-- 			left = 8,
	-- 			widget = wibox.container.margin
	-- 		},
	-- 		id = 'background_role',
	-- 		forced_width = wibar_height,
	-- 		forced_height = wibar_height,
	-- 		widget = wibox.container.background,
	-- 	},
	-- }

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
    -- layout = {
    --     -- spacing = 2,
    --     -- spacing_widget = {
    --     --     widget = wibox.widget.separator,
    --     -- },
    --     layout  = wibox.layout.fixed.horizontal
    -- },
    widget_template = {
      --   {
						-- {
						-- 	id = 'index_role',
						-- 	widget = wibox.widget.textbox,
						-- },
						-- left = 2,
						-- top = 8,
						-- right = 2,
						-- bottom = 8,
						-- widget  = wibox.container.margin,
      --   },

----
        {
            {
                {
									{
										{
											id     = 'index_role',
											widget = wibox.widget.textbox,
										},
										left = -3,
										right = -3,
										widget = wibox.container.margin
									},
									top = 4,
									bottom = 4,
									widget  = wibox.container.margin,
                },
                layout = wibox.layout.fixed.horizontal,
            },
            left  = 4,
            right = 4,
            widget = wibox.container.margin
        },
----

        id = 'background_role',
        widget = wibox.container.background,
        -- Add support for hover colors and an index label
        create_callback = function(self, c3, index, objects) --luacheck: no unused args
					self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
					self:connect_signal('mouse::enter', function()
							-- BLING: Only show widget when there are clients in the tag
							if #c3:clients() > 0 then
								-- BLING: Update the widget with the new tag
								awesome.emit_signal("bling::tag_preview::update", c3)
								-- BLING: Show the widget
								awesome.emit_signal("bling::tag_preview::visibility", s, true)
							end
					end)
					self:connect_signal('mouse::leave', function()
							-- BLING: Turn the widget off
							awesome.emit_signal("bling::tag_preview::visibility", s, false)
					end)
        end,
        update_callback = function(self, c3, index, objects) --luacheck: no unused args
            self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
        end,
    },
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
		{
			{
				format = "%R",
				font = "Cascadia Code 10",
				widget = wibox.widget.textclock
			},
			halign = "right",
			widget = wibox.container.place
		},
		{
			{
				format = "%F",
				font = "Cascadia Code 10",
				widget = wibox.widget.textclock
			},
			halign = "right",
			widget = wibox.container.place
		},
		layout = wibox.layout.fixed.vertical,
	}

	-- @DOC_WIBAR@
	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "bottom",
		screen = s
	})

	-- @DOC_SETUP_WIDGETS@
	-- Add widgets to the wibox
	s.mywibox.widget = {
		{
			forced_width = display_width * 0.3,

			left = 8,
			widget = wibox.container.margin
		},
		{
			forced_width = display_width * 0.4,

			s.mytaglist,

			halign = "center",
			widget = wibox.container.place,
		},
		{
			forced_width = display_width * 0.3,

			{
				{
					{
						wibox.widget.systray(),

						top = 9,
						right = 12,
						bottom = 9,
						widget = wibox.container.margin
					},
					{
						s.mytext_clock,

						valign = "center",
						widget = wibox.container.place
					},

					layout = wibox.layout.fixed.horizontal
				},

				halign = "right",
				widget = wibox.container.place
			},

			right = 8,
			widget = wibox.container.margin,
		},
		layout = wibox.layout.align.horizontal,
	}
end)
-- }}}

-- {{{ Mouse bindings
-- @DOC_ROOT_BUTTONS@
awful.mouse.append_global_mousebindings({
	awful.button({}, 3, function () mymainmenu:toggle() end),
	-- awful.button({}, 4, awful.tag.viewprev),
	-- awful.button({}, 5, awful.tag.viewnext),
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
	awful.key({ modkey }, "e", function () awful.spawn("thunar") end, { description = "open file explorer", group = "launcher" }),
	awful.key({ modkey }, "c", function () awful.spawn("qalculate-gtk") end, { description = "open calculator", group = "launcher" }),

	awful.key({ modkey, "Control", "Mod1" }, "a", function()
		awful.spawn("kitty --session /home/marvin/Misc/kitty/sessions/chess")
	end,
	{ description = "open chess session", group = "sessions" }),

	awful.key({ modkey, "Control", "Mod1" }, "s", function()
		awful.spawn("kitty --session /home/marvin/Misc/kitty/sessions/susurrus")
		awful.spawn("firefox --new-window localhost:8080")
	end,
	{ description = "open susurrus session", group = "sessions" }),

	awful.key({ modkey, "Control", "Mod1" }, "h", function()
		awful.spawn("kitty --session /home/marvin/Misc/kitty/sessions/www")
	end,
	{ description = "open www session", group = "sessions" }),
})

-- General Awesome keys
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "slash", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "e", awesome.quit, { description = "quit awesome", group = "awesome" }),
})

local function delete_tag()
    local t = awful.screen.focused().selected_tag
    if not t then return end
    t:delete()
end

local function add_tag()
    awful.tag.add("tag", {
        screen = awful.screen.focused(),
        layout = awful.layout.layouts[1]}):view_only()
end

-- local function rename_tag()
--     awful.prompt.run {
--         prompt       = "New tag name: ",
--         textbox      = awful.screen.focused().mypromptbox.widget,
--         exe_callback = function(new_name)
--             if not new_name or #new_name == 0 then return end

--             local t = awful.screen.focused().selected_tag
--             if t then
--                 t.name = new_name
--             end
--         end
--     }
-- end

local function move_to_new_tag()
    local c = client.focus
    if not c then return end

    local tag = awful.tag.add(c.class, {
			screen= c.screen,
			layout = awful.layout.layouts[1]
		})
    c:tags({ tag })
    tag:view_only()
end

-- local function copy_tag()
--     local t = awful.screen.focused().selected_tag
--     if not t then return end

--     local clients = t:clients()
--     local t2 = awful.tag.add(t.name, awful.tag.getdata(t))
--     t2:clients(clients)
--     t2:view_only()
-- end

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),


awful.key({ modkey,           }, "a", add_tag, {description = "create a new tag", group = "tag"}),
awful.key({ modkey, "Shift"   }, "a", delete_tag, {description = "delete the current tag", group = "tag"}),
awful.key({ modkey, "Control"   }, "a", move_to_new_tag, {description = "create a new tag with the focused client", group = "tag"}),
-- awful.key({ modkey, "Mod1"   }, "a", copy_tag, {description = "create a copy of the current tag", group = "tag"}),
-- awful.key({ modkey, "Shift"   }, "r", rename_tag, {description = "rename the current tag", group = "tag"}),
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
		awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle , { description = "toggle floating", group = "client" }),
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
		)
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
			-- floating = true,
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
			width = 600,
			height = 800
		}
	}

	ruled.client.append_rule {
		rule = { class = "Joplin" },
		properties = {
			-- floating = true,
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
