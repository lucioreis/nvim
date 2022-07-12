local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = {
	"jsonls",
	"sumneko_lua",
	"elixirls",
  "tailwindcss",
	"html",
	"tsserver",
  "cssls",
  "graphql",
  "emmet_ls",
  "prismals"
}

lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
  if server == "emmet_ls" then
    opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
  end
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
