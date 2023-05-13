pcall(require, "luarocks.loader")
local awful = require("awful")
--local wibox = require("wibox")
local spawn = require("awful.spawn")
--local gears = require("gears")
--local beautiful = require("beautiful")
--local watch = require("awful.widget.watch")
--local getCam = os.execute("lsmod | grep -E '^uvcvideo' | cut -b 31")

local getCam = [[lsmod | grep -E '^uvcvideo' | cut -b 31]]

--if spawn.easy_async(getCam) == 0 then
--	print("off")
--elseif spawn.easy_async(getCam) == 1 then
--	print("on")
--end

--if os.execute("lsmod | grep -E '^uvcvideo' | cut -b 31") == 0 then
--	print("off")
--elseif os.execute("lsmod | grep -E '^uvcvideo' | cut -b 31") == 1 then
--	print("on")
--end
