local ok, elixir = pcall(require,"elixir")
if not ok then
  return
end

elixir.setup({
  -- specify a repository and branch
  repo = "mhanberg/elixir-ls", -- defaults to elixir-lsp/elixir-ls
  branch = "mh/all-workspace-symbols", -- defaults to nil, just checkouts out the default branch, mutually exclusive with the `tag` option
  tag = "v0.9.0", -- defaults to nil, mutually exclusive with the `branch` option

  -- default settings, use the `settings` function to override settings
  settings = elixir.settings({
    dialyzerEnabled = true,
    fetchDeps = true,
    enableTestLenses = true,
    suggestSpecs = true,
  }),
})
