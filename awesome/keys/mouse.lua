local awful = require("awful")

local modkey = require("keys.mod").modKey

local mouseBindings = awful.util.table.join(
	awful.button({}, 1, function(c)
		_G.client.focus = c
		c:raise()
	end),
	awful.button({ modkey }, 1, awful.mouse.client.move),
	awful.button({ modkey }, 3, awful.mouse.client.resize),
	awful.button({ modkey }, 4, function()
		awful.layout.inc(1)
	end),
	awful.button({ modkey }, 5, function()
		awful.layout.inc(-1)
	end)
)

return mouseBindings

--local globalKeys = awful.util.table.join(
--	------ Default Key binds -----------------------------------------------------------------
--
--	-- Focus next window down
--	awful.key({ modkey }, "j", function()
--		awful.client.focus.byidx(1)
--	end),

-- {{{ Default Mouse bindings
--root.buttons(gears.table.join(
--	awful.button({}, 3, function()
--		mymainmenu:toggle()
--	end),
--	awful.button({}, 4, awful.tag.viewnext),
--	awful.button({}, 5, awful.tag.viewprev)
--))
-- }}}
