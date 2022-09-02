local M = {}

-- TODO: backfill this to template
local keymap = vim.keymap.set
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  --   border = "rounded",
  -- })
  -- local completer = vim.lsp.handlers["textDocument/hover"]

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
  -- local definer = vim.lsp.handlers["textDocument/definition"]
  -- vim.lsp.handlers["textDocument/definition"] = vim.lsp.with(
  --   function (err, result, ctx, conf)
  --     print(vim.inspect(result))
  --     definer(err, result, ctx, conf)
  --   end, {
  --   border = "rounded",
  -- })

end -- M.setup

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

-- local function signature_loader(bufnr)
-- 	local ok, signature = pcall(require, "lsp_signature")
-- 	if not ok then
-- 		return
-- 	end
-- 	signature.on_attach({
-- 		bind = true,
-- 		handler_opts = {
-- 			border = "rounded",
-- 		},
-- 	}, bufnr)
-- end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  -- nvim_buf_set_keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  -- keymap("n", "gr", vim.lsp.buf.references, opts)
  -- nvim_buf_set_keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  -- nvim_buf_set_keymap("n", "<leader>f", vim.diagnostic.open_float, opts)
  keymap("n", "gl", function()
    vim.diagnostic.open_float({ border = "rounded" })
  end, opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{ async = true }' ]])
end

--capabilities = vim.lsp.protocol.make_client_capabilities()
-- astronvim.lsp.capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
-- astronvim.lsp.capabilities.textDocument.completion.completionItem.snippetSupport = true
-- astronvim.lsp.capabilities.textDocument.completion.completionItem.preselectSupport = true
-- astronvim.lsp.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
-- astronvim.lsp.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
-- astronvim.lsp.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
-- astronvim.lsp.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
-- astronvim.lsp.capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
-- astronvim.lsp.capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = { "documentation", "detail", "additionalTextEdits" },
-- }
-- astronvim.lsp.capabilities = user_plugin_opts("lsp.capabilities", astronvim.lsp.capabilities)
-- astronvim.lsp.flags = user_plugin_opts "lsp.flags"
M.on_attach = function(client, bufnr)
  -- vim.notify(client.name .. " starting...")
  -- TODO: refactor this into a method that checks if string in list
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end
  lsp_keymaps(bufnr)
  -- signature_loader(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
