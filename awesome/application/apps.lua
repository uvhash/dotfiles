local filesystem = require("gears.filesystem")

return {
	default = {
		terminal = "alacritty",
		lock = "slock",
		screenshot = "flameshot gui",
		browser = "firefox",
		editor = "nvim",
		passwordManager = "keepassxc",
		steam = "steam",
		dmenu = "dmenu_run -c -l 15",
		launcher = "rofi -show drun -theme ~/.config/rofi/style-10.rasi",
	},

	run_on_start_up = {
		"xrandr -s 3456x2160 &",
		"picom --config /home/tsathogguakug/.config/picom/1picom.conf &",
		"nitrogen --restore &",
	},
}
