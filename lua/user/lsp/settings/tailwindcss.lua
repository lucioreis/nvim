print("Loaded personal setting of tailwindcss")
return {
  cmd = { "tailwindcss-language-server", "--stdio"},
  init_options = {
    userLanguages = {
      text = "html",
      elixir = "html",
      heex = "html",
      eruby = "erb",
    },
  },
}
