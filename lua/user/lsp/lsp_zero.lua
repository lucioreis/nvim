local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

local servers = {
  "cssls",
  "jsonls",
  "tailwindcss",
  "html",
  "sumneko_lua",
  "tsserver",
  "yamlls",
  "bashls",
  "prismals",
}

lsp.preset('recommended')

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = false,
  call_servers = 'local',
  sign_icons = {
    error = '', --✘
    warn = '', --▲
    hint = '', --⚑
    info = '' --
  }
})
lsp.on_attach(function(client, bufnr)
  local illuminate_ok, illuminate = pcall(require, "illuminate")
  if illuminate_ok then
    illuminate.on_attach(client)
  end
  local opts = { silent = true, buffer = bufnr }
  local isTelescopeOk, telescope_builtin = pcall(require, "telescope.builtin")
  if isTelescopeOk then
    vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts)
    vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, opts)
    vim.keymap.set("n", "go", telescope_builtin.lsp_type_definitions, opts)
    vim.keymap.set("n", "gr", telescope_builtin.lsp_references, opts)
  else
    vim.keymap.set("n", "gd", vim.lsp.buf.lsp_definitions, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.lsp_implementations, opts)
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  end
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)
  -- more code  ...
end)

lsp.ensure_installed(servers)

--[[ lsp.configure("", { ]]
--[[   flags = { ]]
--[[     debounce_text_changes = 150, ]]
--[[   }, ]]
--[[   on_attach = function(client, bufnr) ]]
--[[   end, ]]
--[[   capabilities = { ]]
--[[     textDocument = { ]]
--[[       completion = { ]]
--[[         completionItem = { ]]
--[[           snippetSupport = false, ]]
--[[         } ]]
--[[       } ]]
--[[     } ]]
--[[   }, ]]
--[[ }) ]]

lsp.nvim_workspace()
lsp.setup()
