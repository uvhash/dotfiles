local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local calendar_widget = require("widget.calendar-widget.calendar")

mytextclock = wibox.widget.textclock()

local cw = calendar_widget()

mytextclock:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		cw.toggle()
	end
end)

return calendar_widget()
