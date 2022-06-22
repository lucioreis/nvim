local ok, autotag = pcall(require, "nvim-ts-autotag")
if not ok then
  print("Autotag not loaded!!")
	return
end

autotag.setup({
	enable = true,

	filetypes = {
		"heex",
    "html",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"svelte",
		"vue",
		"tsx",
		"jsx",
		"rescript",
		"xml",
		"php",
		"markdown",
		"glimmer",
		"handlebars",
		"hbs",
	},
	skip_tags = {
		"area",
		"base",
		"br",
		"col",
		"command",
		"embed",
		"hr",
		"img",
		"slot",
		"input",
		"keygen",
		"link",
		"meta",
		"param",
		"source",
		"track",
		"wbr",
		"menuitem",
	},
})
