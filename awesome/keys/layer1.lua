local awful = require("awful")
require("awful.autofocus")

local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

local apps = require("application.apps")
local superKey = require("keys.super")
local widgets = require("widget.widgets")

local layer1Keys = awful.util.table.join(awful.key({ superKey }, "u", function() end))
