local opts = {silent = true}
local keymap = vim.keymap.set
keymap({ "n", "i" }, "ç", "$", opts)
