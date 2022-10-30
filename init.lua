local ok, impatient = pcall(require, "imapatient")
if ok then
  impatient.enable_profile()
end

require("user.settings.plugins")
require("user.settings.options")

--Appearance
require("user.appearance.colorizer")
require("user.appearance.colorscheme")
require("user.appearance.dressing")
require("user.appearance.indentline")
require("user.appearance.lualine")
require("user.appearance.fidget")
-- require("user.appearance.matchup")
require("user.appearance.tsrainbow")

--Commands
require("user.commands.autocommands")
--Debugger
require("user.debugger.dap")

--Edit
require("user.edit.autopairs")
require("user.edit.cmp")
require("user.edit.comment")
-- require("user.edit.coq")
require("user.edit.treesitter")
require("user.edit.registers")
require("user.edit.renamer")
require("user.edit.surround")
require("user.edit.autotag")

--GIT
require("user.git.gitsigns")

--LSP
require("user.lsp")

--NAVIGATION
require("user.navigation.alpha")
require("user.navigation.symbols-outline")
-- require("user.navigation.bufferline")
require("user.navigation.hop")
-- require("user.navigation.jabs") -- Just another buffer switch
require("user.navigation.neo-tree")
require("user.navigation.neoscroll")
require("user.navigation.numb") -- Peek lines in a non-obtrusive way
--require("user.navigation.nvim-tree")
require("user.navigation.telescope")
require("user.navigation.project")
--require("user.navigation.bookmarks")
require("user.navigation.harpoon")
require("user.navigation.trouble")

--SETTINGS
require("user.settings.session-manager")
require("user.settings.toggleterm")
require("user.settings.keymaps")
require("user.settings.whichkey")

-- local icons = require "nvim-nonicons"
-- icons.get("file")

-- --in case need to remember how to get filetype

--lua =vim.bo.filetype
-- local create_little_window = function(messages)
--   local msg_lines = #messages
--
--   local msg_width = 0
--   for _, v in ipairs(messages) do
--     msg_width = math.max(msg_width, #v + 1)
--   end
--
--   local ui = vim.api.nvim_list_uis()[1]
--   local ui_width = ui.width
--
--   local win_height = math.min(50, msg_lines)
--   local win_width = math.min(150, msg_width) + 5
--
--   return vim.api.nvim_open_win(bufnr, false, {
--     relative = "editor",
--     style = "minimal",
--     height = win_height,
--     width = win_width,
--     -- row = ui_height - win_height - 10,
--     row = 1,
--     col = ui_width - win_width - 2,
--   })
-- end
--
-- local win = create_little_window({"Comecou!"})
--
-- require("nvim-ts-autotag").setup{
--   enable = true,
--   filetypes = {"heex"}
-- }
-- require'nvim-treesitter.configs'.setup {
--   autotag = {
--     enable = true,
--     filetypes = { "heex"},
--   }
-- }
