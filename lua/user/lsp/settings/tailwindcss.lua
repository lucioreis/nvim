return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	init_options = {
		userLanguages = {
			text = "html",
			eelixir = "html-heex",
			heex = "html",
			eruby = "erb",
		},
	},
}
