pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Looks
beautiful.init("~/.config/awesome/looks/theme.lua")
require("looks.layouts")

-- Keybinds
require("keys.globals")
--require("keys.layer1")
require("keys.clients")
require("keys.mouse")
require("keys.mouseFocus")
require("keys.rules")
require("keys.mod")
require("keys.super")
_G.root.keys(require("keys.globals"))

-- Tags
require("tag.screenTags")

-- Applications
require("application.apps")
require("application.startup")

-- Error handling
require("error.errorhandling")
