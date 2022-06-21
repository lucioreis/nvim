local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local _general_settings = vim.api.nvim_create_augroup("_general_settings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf", "help", "man", "lspinfo", "fzf" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>close<cr>", { noremap = true, silent = true, buffer = 0 })
	end,
	group = _general_settings,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		require("vim.highlight").on_yank({ higroup = "Visual", timeout = 200 })
	end,
	group = _general_settings,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	command = "set formatoptions-=cro",
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

local f
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