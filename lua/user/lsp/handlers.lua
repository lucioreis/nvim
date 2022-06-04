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

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
      return
    end
    illuminate.on_attach(client)
  -- end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer=bufnr}
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  -- nvim_buf_set_keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  -- nvim_buf_set_keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  -- nvim_buf_set_keymap("n", "<leader>f", vim.diagnostic.open_float, opts)
  keymap(
    "n",
    "gl",
    function() vim.diagnostic.open_float({ border = "rounded" }) end,
    opts
  )
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format{ async = true }' ]]
end

M.on_attach = function(client, bufnr)
-- vim.notify(client.name .. " starting...")
-- TODO: refactor this into a method that checks if string in list
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
