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
require("user.edit.comment")
require("user.edit.treesitter")
require("user.edit.registers")
require("user.edit.renamer")
require("user.edit.surround")
require("user.edit.autotag")

--GIT
require("user.git.gitsigns")
require("user.git.diffview")
require("user.git.neogit")

--LSP
require('user.appearance.noice')
require("user.lsp")
require("user.edit.cmp")

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
