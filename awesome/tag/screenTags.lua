local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local beautiful = require("beautiful")

local modkey = require("keys.mod").modKey

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Things i added
local taglist_buttons = require("tag.taglist-buttons")
local tasklist_buttons = require("tag.tasklist-buttons")
local widgets = require("widget.widgets")

awful.screen.connect_for_each_screen(function(s)
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})

	-- Create tasklist widgets
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	})

	s.topbar = awful.wibar({
		position = "top",
		screen = s,
	})

	s.bottombar = awful.wibar({
		position = "bottom",
		screen = s,
	})

	-- TOPBAR ---------------------------------------------------------------------------
	s.topbar:setup({
		layout = wibox.layout.align.horizontal,
		expand = "none",

		-- Left widgets
		{
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist,
		},

		-- Middle widgets
		{
			layout = wibox.layout.fixed.horizontal,
			-- Time widget
			widgets.time,
		},

		--Right widghts
		{
			layout = wibox.layout.fixed.horizontal,

			--widgets.camera({
			--	size = 55,
			--	widget_type = "arc",
			--	--bg_color = "#000000",
			--	main_color = "#0080ff",
			--	off_color = "#0a4e91",
			--	thickness = 4,
			--}),

			-- Microphone widget settings
			widgets.mic({
				size = 55,
				device = "pulse",
				mixer_cmd = "mixer",
				widget_type = "arc",
				bg_color = "#00000000",
				main_color = "#1ad0f6",
				mute_color = "#0a5362",
				thickness = 4,
				step = 5,
			}),

			-- Volume widget settings
			widgets.volume({
				size = 55,
				device = "pulse",
				mixer_cmd = "mixer",
				widget_type = "arc",
				bg_color = "#00000000",
				main_color = "#dd17bb",
				mute_color = "#620a53",
				thickness = 4,
				step = 5,
			}),
			-- Brightness widget settings
			--			widgets.brightness({
			--				type = "arc",
			--				program = "xbacklight",
			--				bg_color = "#00000000",
			--				main_color = "#00fdff",
			--				tooltip = true,
			--				size = 100,
			--			}),
			-- Battery widget settings
			widgets.battery({
				size = 55,
				charging_color = "#00ff84",
				main_color = "#00ff84",
				bg_color = "#00000000",
				arc_thickness = 4,
				notification_position = "top_right",
			}),
		},
	})

	-- Bottombar ------------------------------------------------------------------------
	s.bottombar:setup({
		layout = wibox.layout.align.horizontal,
		--expand = "none",

		-- Left widgets
		{
			layout = wibox.layout.fixed.horizontal,
			--widgets.mainmenu,
			--widgets.time,
			--s.mytasklist,
		},

		-- Middle widgets
		{
			layout = wibox.layout.fixed.horizontal,
			s.mytasklist,
		},

		--Right widghts
		{
			layout = wibox.layout.fixed.horizontal,
			widgets.cpu({
				width = 300,
				forced_width = 300,
				step_width = 1,
				timeout = 1,
			}),
		},
	})
end)

client.connect_signal("manage", function(c)
	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		awful.placement.no_offscreen(c)
	end
end)

client.connect_signal("property::minimized", function(c)
	c.minimized = false
end)
