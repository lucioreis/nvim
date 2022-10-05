local ok, plugin = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

plugin.setup({
  highlight = {
      -- ...
  },
  -- ...
  rainbow = {
    enable = true,
    disable = { "jsx", "html" }, -- list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {"#ff0000", "#ffa500", "#ffff00", "#76ff03", "#0000ff", "#fa0786", "#ee82ee"}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
})

