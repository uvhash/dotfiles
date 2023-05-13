local filesystem = require("gears.filesystem")
local wibox = require("wibox")

local widgets = {
	battery = require("widget.batteryarc-widget.batteryarc"),
	space = require("widget.space"),
	brightness = require("widget.brightness-widget.brightness"),
	volume = require("widget.volume-widget.volume"),
	calendar = require("widget.time-widget"),
	time = require("widget.timeClock"),
	mainmenu = require("widget.mainmenu"),
	cpu = require("widget.cpu-widget.cpu-widget"),
	mic = require("widget.mic-widget.mic-widget"),
	camera = require("widget.camera-widget.camera-widget"),
	--tasklist = require("widget.tasklist-widget"),
}

return widgets
