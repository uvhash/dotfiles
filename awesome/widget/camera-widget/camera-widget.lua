local awful = require("awful")
local wibox = require("wibox")
local spawn = require("awful.spawn")
local gears = require("gears")
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")
--local utils = require("widget.camera-widget.utils")

--local function GET_CAMERA_CMD()
--	return os.execute("lsmod | grep -E '^uvcvideo' | cut -b 31")
--end

local GET_CAMERA_CMD = [[lsmod | grep -E '^uvcvideo' | cut -b 31]]

local widget_types = {
	arc = require("widget.camera-widget.widgets.arc-widget"),
}

local camera = {}

local function worker(user_args)
	local args = user_args or {}

	local widget_type = args.widget_type
	local refresh_rate = args.refresh_rate or 1

	if widget_types[widget_type] == nil then
		camera.widget = widget_types["icon_and_text"].get_widget(args.icon_and_text_args)
	else
		camera.widget = widget_types[widget_type].get_widget(args)
	end

	local function update_graphic(widget, stdout)
		local status = string.match(stdout, "%d")
		if status == 0 then
			widget:off()
		elseif status == 1 then
			widget:on()
		end
	end

	watch(GET_CAMERA_CMD, refresh_rate, update_graphic, camera.widget)

	return camera.widget
end

return setmetatable(camera, {
	__call = function(_, ...)
		return worker(...)
	end,
})
