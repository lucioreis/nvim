local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  print("TreeSitter load failed!")
  return
end

configs.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  auto_install = true,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable_virtual_text = true,
    disable = { "html" }, -- optional, list of language that will be disabled
    include_match_words = true
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    -- disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
    enable = true,
    filetypes = {"html", "heex", "xml", "typescriptreact"}
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-d>',
      scope_incremental = '<C-d>',
    }
  }
}
