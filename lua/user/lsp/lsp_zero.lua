local ok, lsp = pcall(require, "lsp-zero")
if not ok then
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

lsp.preset('recommended')

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
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
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
  -- more code  ...
end)

lsp.ensure_installed(servers)

local lsp_opts = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
}

for _, server in ipairs(servers) do
  lsp.configure(server, lsp_opts)
end

lsp.configure('cssls', {
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
  end,
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        }
      }
    }
  },
})

lsp.setup()
