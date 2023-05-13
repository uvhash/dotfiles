local awful = require("awful")

awful.spawn.with_shell("xrandr -s 1920x1080 -r 144.00")
awful.spawn.with_shell("picom --config /home/tsathogguakug/.config/picom/1picom.conf")
awful.spawn.with_shell("nitrogen --restore")
awful.spawn.with_shell("play-with-mpv")
awful.spawn.with_shell("caps")
awful.spawn.with_shell("xautolock -time 30 -locker slock")
--awful.spawn.with_shell("polyLaunch")
