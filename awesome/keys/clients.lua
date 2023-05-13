local awful = require("awful")
require("awful.autofocus")

local modkey = require("keys.mod").modKey

local clientKeys = awful.util.table.join(

	-- Fullscreen
	awful.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end),

	-- Maximize window
	awful.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end),

	-- Minimize window
	awful.key({ modkey }, "n", function(c)
		c.minimized = not c.minimized
		c:raise()
	end),

	-- Unminimize window
	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end),

	-- Kill app
	awful.key({ modkey, "Shift" }, "c", function(c)
		c:kill()
	end)
)

return clientKeys
