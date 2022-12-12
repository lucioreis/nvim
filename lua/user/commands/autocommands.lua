local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local _general_settings = vim.api.nvim_create_augroup("_general_settings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "DressingSelect", "qf", "help", "man","vim", "lspinfo", "fzf", "bookmarks", "toggleterm", "Neogit*" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>close<cr>", { noremap = true, silent = true, buffer = 0 })
	end,
	group = _general_settings,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "vim" },
	callback = function()
		--[[ vim.keymap.set("n", "<cr>", "<cr>", { noremap = true, silent = true, buffer = 0 }) ]]
    vim.keymap.del("n", "<CR>", {buffer = 0})
	end,
	group = _general_settings,
})



-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "NvimTree" },
--   callback = function()
--     local ok, _ = pcall(require, "neo-tree")
--     if ok then
--       vim.cmd "<cmd>NeoTreeClose<cr>"
--     end
--   end,
-- 	group = _general_settings,
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		require("vim.highlight").on_yank({ higroup = "Visual", timeout = 200 })
	end,
	group = _general_settings,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions
			- "a" -- turn off auto formatting of paragraphs
			- "t" -- Auto-wrap text using 'textwidth': nope
			+ "c" -- Auto-wrap comments using 'textwidtAuto-wrap comments using 'textwidth': nope
			+ "r" -- keep the comments going on enter
			- "o" -- Autpmatically insert the coment leader after hitting o: nope
			+ "n" -- Make ident lists great again
			- "2" -- I could'n care less
			+ "1" -- Don't brake a line after a one-letter word
			+ "p" -- Don't break 'Mr.' and 'Feyman!'
			+ "q"
		vim.opt.showtabline = 0
	end,
	group = _general_settings,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	command = "set nobuflisted",
	group = _general_settings,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.relativenumber = false
	end,
	group = _general_settings,
})

vim.api.nvim_create_autocmd("InsertLeavePre", {
	callback = function()
		vim.opt.relativenumber = true
	end,
	group = _general_settings,
})

local setlocal = augroup("_setlocal", { clear = true })
autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	command = "setlocal wrap | setlocal spell",
	group = setlocal,
})

local _auto_resize = augroup("_auto_resize", { clear = true })
autocmd("VimResized", { command = "tabdo wincmd =", group = _auto_resize })

local alpha = augroup("_alpha", { clear = true })
autocmd("User", { pattern = "AlphaReady", command = "set showtabline=0", group = alpha })

autocmd("BufUnload", { command = "set showtabline=2", buffer = 0, group = alpha })

-- local lsp = augroup("_LSP", { clear = true })
-- autocmd("BufWritePre", {
-- 	callback = function()
-- 		vim.lsp.buf.format({ async = false })
-- 	end,
-- 	group = lsp,
-- })

vim.cmd([[
  "
  " augroup _auto_resize
  "   autocmd!
  "   autocmd VimResized * tabdo wincmd = 
  " augroup end
  "
  " augroup _alpha
  "   autocmd!
  "   autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  " augroup end
]])

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
