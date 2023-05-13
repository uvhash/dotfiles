local awful = require("awful")
local autofocus = require("awful.autofocus")
local beautiful = require("beautiful")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")
local filesystem = require("gears.filesystem")

local function make_gradient(color)
	local alpha_level = "22"
	return {
		type = "linear",
		from = { 0, 0 },
		to = { 0, dpi(24) },
		stops = {
			{ 0.1, color },
			{ 0.1, color .. alpha_level },
		},
	}
end

local function changingBorders(frequency1, frequency2, frequency3, phase1, phase2, phase3, center, width, len)
	if center == nil then
		center = 128
	end
	if width == nil then
		width = 127
	end
	if len == nil then
		len = 120
	end
	genLoop = 0
	while genLoop < len do
		red = string.format("%02x", (math.floor(math.sin(frequency1 * genLoop + phase1) * width + center)))
		grn = string.format("%02x", (math.floor(math.sin(frequency2 * genLoop + phase2) * width + center)))
		blu = string.format("%02x", (math.floor(math.sin(frequency3 * genLoop + phase3) * width + center)))
		border_animate_colours[genLoop] = "#" .. red .. grn .. blu
		genLoop = genLoop + 1
	end
end

local theme = {}

-- Colors -----------------------------------------------------------------------------

--theme.colors = {
--	white = "#ffffff",
--	black = "#000000",
--	grey = "#657b83",
--	darkgrey = "#1b1818",
--
--	red = "#ff0055",
--	green = "#00ff84",
--	yellow = "#ffff00",
--	blue = "#76c1ff",
--	magenta = "#ff5dfd",
--	cyan = "#05e0f4",
--	orange = "#ff9e00",
--}

theme.transparent = "#00000000"

theme.font = "Mononoki Nerd Font 10"

theme.bg_normal = "#120b10" .. 99
--theme.bg_normal = "#000000"
theme.bg_focus = "#120b10"
theme.bg_urgent = "#283593"
theme.bg_minimize = "#120b10"
theme.bg_systray = "#654321"

theme.fg_normal = "#ff0055"
theme.fg_focus = "#ffff00"
theme.fg_urgent = "#283593"
theme.fg_minimize = "#00ff84"

theme.useless_gap = dpi(5)
theme.border_width = dpi(2)
theme.border_normal = "#000000"
--theme.border_focus = "#ffff00"
theme.border_focus = "#ffff00"
theme.border_marked = "#000000"

-- Taglist ----------------------------------------------------------------------------

theme.taglist_fg_occupied = "#ffff00"
theme.taglist_bg_occupied = make_gradient("#ff0055" .. 99)
theme.taglist_fg_focus = "#ffff00"
theme.taglist_bg_focus = make_gradient("#ffff00" .. 99)
theme.taglist_fg_empty = "#ff0055"
theme.taglist_spacing = 20
theme.taglist_shape = gears.shape.rectangle
--theme.taglist_shape_border_width = 1
--theme.taglist_shape_border_color_focus = "#ffff00"

-- Tasklist ---------------------------------------------------------------------------

theme.tasklist_fg_normal = "#ff0055"
theme.tasklist_fg_focus = "#ffff00"
theme.tasklist_fg_minimize = "#00ff84"
theme.tasklist_fg_urgent = "#ff5dfd"

theme.tasklist_bg_normal = make_gradient("#120b10" .. 99)
theme.tasklist_bg_focus = make_gradient("#ffff00" .. 99)
theme.tasklist_bg_minimize = make_gradient("#00ff84" .. 99)
theme.tasklist_bg_urgent = make_gradient("#ff5dfd" .. 99)

theme.tasklist_spacing = dpi(5)
--theme.tasklist_forced_width = dpi(100)
theme.tasklist_shape = gears.shape.rectangle
--theme.tasklist_icon_size = dpi(1)
theme.tasklist_shape_border_width = 0
theme.tasklist_shape_border_width_focus = 0
theme.tasklist_shape_border_width_minimized = 0
theme.tasklist_shape_border_color_focus = "#ffff00"
theme.tasklist_shape_border_color_minimized = "#00ff84"
theme.tasklist_shape_border_color_urgent = "#ff5dfd"

-- Menu --------------------------------------------------------------------------------

return theme
