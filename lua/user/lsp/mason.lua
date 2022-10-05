local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local servers = {
	"cssls",
	"jsonls",
	"tailwindcss",
	--"cssmodules_ls",
	--"emmet_ls",
	"html",
	"sumneko_lua",
	"tsserver",
	"yamlls",
	"bashls",
	--"graphql",
	"prismals",
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if server == "emmet_ls" then
		opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
	end
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end

	lspconfig[server].setup(opts)

	::continue::
end

-- TODO: add something to installer later
-- require("lspconfig").motoko.setup {}
mason.setup()