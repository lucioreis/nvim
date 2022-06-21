return  {
    filetypes = { 'html', 'heex' },
    single_file_support = true,
    settings = {},
    init_options = {
      provideFormatter = true,
      embeddedLanguages = { css = true, javascript = true, elixir=true },
      configurationSection = { 'html', 'css', 'javascript', 'elixir' },
    },
  }
