local awful = require("awful")
local wibox = require("wibox")
local spawn = require("awful.spawn")
local gears = require("gears")
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")
local utils = require("widget.mic-widget.utils")

local LIST_DEVICES_CMD = [[sh -c "pacmd list-sinks; pacmd list-sources"]]
local function GET_MUTE_CMD(device)
	return "amixer -D " .. device .. " sget Capture"
end
local function TOG_MUTE_CMD(device)
	return "amixer -D " .. device .. " sset Capture toggle"
end

local widget_types = {
	arc = require("widget.mic-widget.widgets.arc-widget"),
}

local mic = {}

local function worker(user_args)
	local args = user_args or {}

	local widget_type = args.widget_type
	local refresh_rate = args.refresh_rate or 1
	local device = args.device or "pulse"

	if widget_types[widget_type] == nil then
		mic.widget = widget_types["icon_and_text"].get_widget(args.icon_and_text_args)
	else
		mic.widget = widget_types[widget_type].get_widget(args)
	end

	local function update_graphic(widget, stdout)
		local mute = string.match(stdout, "%[(o%D%D?)%]") -- \[(o\D\D?)\] - [on] or [off]
		if mute == "off" then
			widget:mute()
		elseif mute == "on" then
			widget:unmute()
		end
		local mic_level = string.match(stdout, "(%d?%d?%d)%%") -- (\d?\d?\d)\%)
		mic_level = string.format("% 3d", mic_level)
		widget:set_volume_level(mic_level)
	end

	function mic:toggle()
		spawn.easy_async(TOG_MUTE_CMD(device), function(stdout)
			update_graphic(mic.widget, stdout)
		end)
	end

	mic.widget:buttons(awful.util.table.join(
		awful.button({}, 3, function()
			if popup.visible then
				popup.visible = not popup.visible
			else
				--				rebuild_popup()
				--				popup:move_next_to(mouse.current_widget_geometry)
			end
		end),
		awful.button({}, 1, function()
			mic:toggle()
		end)
	))

	watch(GET_MUTE_CMD(device), refresh_rate, update_graphic, mic.widget)

	return mic.widget
end

return setmetatable(mic, {
	__call = function(_, ...)
		return worker(...)
	end,
})
