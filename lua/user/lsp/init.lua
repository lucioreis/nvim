local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end


require "lsp_signature"
-- require "user.lsp.lsp-installer"
require("user.lsp.mason")
--[[ require("user.lsp.handlers").setup() ]]
require("user.lsp.lsp_zero")
--require "user.lsp.null-ls"

local l_status_ok, lsp_lines = pcall(require, "lsp_lines")
if not l_status_ok then
  return
end

lsp_lines.setup()



