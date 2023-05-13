local awful = require("awful")
local wibox = require("wibox")
local tasklist_buttons = require("tag.tasklist-buttons")

local mytasklist = awful.widget.tasklist({
	filter = awful.widget.tasklist.filter.currenttags,
	buttons = tasklist_buttons,
})

local mytasklist
