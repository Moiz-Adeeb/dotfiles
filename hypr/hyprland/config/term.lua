local term = {
	app = "footclient",
	sh = "fish",
	mux = "tmux new-session",
	---@type AppList
	monitor = {
		default = 1,
		{
			id = "fastfetch",
			name = "Fastfetch",
			cmd = "fastfetch",
		},
		{
			id = "macchina",
			name = "Macchina",
			cmd = "macchina",
		},
	},
}

return term
