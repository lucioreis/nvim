local opts = { silent = true }

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Get help for word under cursor
keymap({ "n", "v", "i" }, "<F1>", "<ESC>:h <C-R>=expand('<cword>')<CR><CR>", opts)

-- Normal --
-- Press Enter to save
keymap("n", "<CR>", ":w<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Remap arrows
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- keymap("n", "<C-v>", "<C-w>v", opts)

-- Navigate buffers
--[[ keymap("n", "<TAB>", ":bnext<CR>", opts) ]]
--[[ keymap("n", "<S-TAB>", ":bprevious<CR>", opts) ]]

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>", opts)

-- Keep cursor on current position on line joins
keymap("n", "J", "mzJ`z", opts)

-- keep the cursor on vertical center
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==gv", opts)
keymap("v", "<A-k>", ":m .-2<CR>==gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom
keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)

local isTelescopeOk, telescope = pcall(require, 'telescope.builtin')
if isTelescopeOk then
  keymap({ "n", "v", "i" }, "<S-F1>", telescope.help_tags, opts)
  keymap({ "n", "v", "i" }, "<S-F1>", function()
    telescope.help_tags(require("telescope.themes").get_dropdown({ previewer = false }))
  end, opts)
  keymap("n", "<F3>", telescope.resume, opts)
  keymap("n", "<F5>", telescope.commands, opts)
  keymap(
    { "n", "i" },
    "<C-f>",
    function()
      telescope.current_buffer_fuzzy_find({ prompt_position = "top", sorting_strategy = "ascending" })
    end,
    opts
  )
  keymap("n", "<C-p>", function()
    telescope.find_files(require("telescope.themes").get_dropdown({ previewer = false }))
  end,
    opts)
  keymap("n", "-", function()
    telescope.buffers(
      require("telescope.themes").get_dropdown({ previewer = false, initial_mode = "normal" })
    )
  end, opts)
end

keymap(
  "n",
  "<F6>",
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]]
  ,
  opts
)
keymap("n", "<F8>", ":echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>", opts)
-- keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_prev, opts)
keymap("n", "[c", "<cmd>cprev<cr>", opts)
keymap("n", "]c", "<cmd>cnext<cr>", opts)

keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

-- Hop.Nvim --
keymap("n", "s", ":HopWord<CR>", opts)
keymap("n", "S", ":HopChar1<CR>", opts)
keymap("n", "f", "<cmd>HopChar1CurrentLineAC<CR>", opts)

-- NeoTree --
keymap("n", "=", ":NeoTreeFloatToggle buffers<CR>", opts)

-- Harpoon --
keymap("n", "<leader>b", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
for i = 1, 9, 1 do
  keymap("n", "<M-" .. i .. ">", "<cmd>lua require('harpoon.ui').nav_file(" .. i .. ")<cr>", opts)
end
keymap("n", "<M-n>", require('harpoon.ui').nav_next, opts)
keymap("n", "<M-p>", require('harpoon.ui').nav_prev, opts)
keymap("n", "<leader>m", require('harpoon.mark').add_file, opts)

-- Trouble --
keymap("n", "tr", "<CMD>TroubleToggle<CR>", opts)
keymap("n", "tr", "<CMD>TroubleToggle<CR>", opts)
keymap("n", "trt", "<CMD>TroubleReset<CR>", opts)

--Tree Climber --
local is_ok, tree_climber = pcall(require, "tree-climber")
if is_ok then
  keymap({ "n", "v", "o" }, "H", tree_climber.goto_parent, opts)
  keymap({ "n", "v", "o" }, "L", tree_climber.goto_child, opts)
  keymap({ "n", "v", "o" }, "<C-j>", tree_climber.goto_next, opts)
  keymap({ "n", "v", "o" }, "<C-k>", tree_climber.goto_prev, opts)
  keymap({ "v", "o" }, "in", tree_climber.select_node, opts)
  keymap("n", "<c-k>", tree_climber.swap_prev, opts)
  keymap("n", "<c-j>", tree_climber.swap_next, opts)
end
