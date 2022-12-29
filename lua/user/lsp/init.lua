--local isNeodevOk, neodev = pcall(require, "neodev")

--if isNeodevOk then
  --neodev.setup()
--end

require("user.lsp.mason")
require("user.lsp.lsp_zero")
--require "user.lsp.null-ls"

--[[ local l_status_ok, lsp_lines = pcall(require, "lsp_lines") ]]
--[[ if not l_status_ok then ]]
--[[   return ]]
--[[ end ]]
--[[]]
--[[ lsp_lines.setup() ]]



