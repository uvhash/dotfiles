local awful = require("awful")
require("awful.autofocus")

local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

local apps = require("application.apps")
local modkey = require("keys.mod").modKey
local widgets = require("widget.widgets")

local globalKeys = awful.util.table.join(
	------ Default Key binds -----------------------------------------------------------------

	-- Focus next window down
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end),

	-- Focus next window up
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end),

	------ Layout Manipulation---------------------------------------------------------------

	-- Move selected window down
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end),

	-- Move selected window up
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end),

	-- Shift window size to the right
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end),

	-- Shift window size to the left
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end),

	-- Move window to the right
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end),

	-- Move window to the left
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end),

	-- Cycle through layouts
	--awful.key({ modkey }, "space", function()
	--	awful.layout.inc(1)
	--end),

	-- Cycle to previous layout
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end),

	------ Standard Program ------------------------------------------------------------------

	-- Reload awesome
	awful.key({ modkey }, "q", awesome.restart),

	-- Quit awesome
	awful.key({ modkey, "Shift" }, "q", awesome.quit),

	-- Spawn Terminal
	awful.key({ modkey, "Shift" }, "Return", function()
		awful.spawn(apps.default.terminal)
	end),

	------ Programs ----------------------------------------------------------------------

	-- Open browser
	awful.key({ modkey }, "o", function()
		awful.util.spawn(apps.default.browser)
	end),

	-- Open slock
	awful.key({ modkey, "Shift" }, "Delete", function()
		awful.util.spawn(apps.default.lock)
	end),

	-- Open Passwords
	awful.key({ modkey, "Shift" }, "p", function()
		awful.util.spawn(apps.default.passwordManager)
	end),

	-- Open Passwords
	awful.key({ modkey }, "/", function()
		awful.util.spawn(apps.default.launcher)
	end),

	-- Open browser
	awful.key({ modkey }, "g", function()
		awful.util.spawn(apps.default.steam)
	end),

	-- Open screenshot
	awful.key({ modkey }, "Print", function()
		awful.util.spawn(apps.default.screenshot)
	end),

	------ Volume ------------------------------------------------------------------------

	-- Mute
	awful.key({}, "F1", function()
		widgets.volume:toggle()
		--awful.util.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")
	end),

	-- Lower volume
	awful.key({}, "F2", function()
		widgets.volume:dec(5)
		--awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")
	end),

	-- Raise volume
	awful.key({}, "F3", function()
		widgets.volume:inc(5)
		--awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")
	end),

	-- Mute mic
	awful.key({ modkey }, "space", function()
		widgets.mic:toggle()
		--awful.util.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle")
	end),
	awful.key({}, "F4", function()
		widgets.mic:toggle()
		--awful.util.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle")
	end),

	-- Spotify-qt next song ">"
	awful.key({ modkey, "Shift" }, "#60", function()
		awful.util.spawn("next")
	end),

	-- Spotify-qt next song "<"
	awful.key({ modkey, "Shift" }, "#59", function()
		awful.util.spawn("back")
	end),

	------ Brightness --------------------------------------------------------------------

	-- Lower brightness
	awful.key({}, "F5", function()
		--widgets.brightness:dec()
		--awful.util.spawn("xbacklight -dec 10")
	end),

	-- Raise brightness
	awful.key({}, "F6", function()
		--widgets.brightness:inc()
		--awful.util.spawn("xbacklight -inc 10")
	end)

	------ Layer 1 Numpad ----------------------------------------------------------------

	-- Raise brightness
	--	awful.key({"Super_L"}, "u", function()
	--		--widgets.brightness:inc()
	--		--awful.util.spawn("xbacklight -inc 10")
	--	end)
)

------ Tag Windows ---------------------------------------------------------------------

for i = 1, 9 do
	-- Hack to only show tags 1 and 9 in the shortcut window (mod + s)
	local descr_view, descr_toggle, descr_move, descr_toggle_focus
	if i == 1 or i == 9 then
		descr_view = { description = "view tag #", group = "tag" }
		descr_toggle = { description = "toggle tage #", group = "tag" }
		descr_move = { description = "move focused client to tag #", groupt = "tag" }
		descr_toggle_focus = { description = "toggle focused client on tag #", group = "tag" }
	end
	globalKeys = awful.util.table.join(
		globalKeys,

		-- view tag only
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, descr_view),

		-- toggle tag display
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, descr_toggle),

		-- Move client to tag
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if _G.client.focus then
				local tag = _G.client.focus.screen.tags[i]
				if tag then
					_G.client.focus:move_to_tag(tag)
				end
			end
		end, descr_move),

		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if _G.client.focus then
				local tag = _G.client.focus.screen.tags[i]
				if tag then
					_G.client.focus:toggle_tag(tag)
				end
			end
		end, descr_toggle_focus)
	)
end

return globalKeys
