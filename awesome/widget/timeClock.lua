local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

mytextclock = wibox.widget.textclock(" %a %b %d, %I:%M ")

return mytextclock
