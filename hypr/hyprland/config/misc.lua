local misc = {
    user = "moiz",
	uwsm = "uwsm app -- ",

    win = {
		ex_sm = "float_extra_small",
		sm = "float_small",
		bg = "float_big",
		lg = "float_large",
	},
}
misc.dir = {
    user = "/home/" .. misc.user,
    conf = "/home/" .. misc.user .. "/.config/",
    hypr = "/home/" .. misc.user .. "/.config/hypr/",
    scripts = "/home/" .. misc.user .. "/.config/hypr/scripts/",
    }
misc.menu = {
    app = "rofi -show drun -run-command '" .. misc.uwsm .. "{cmd}'",
    power = misc.dir.conf .. "rofi/powermenu/powermenu.sh",
}

return misc
