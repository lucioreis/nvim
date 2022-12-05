-- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
local ok, fidget = pcall(require, "fidget")
if not ok then
  return
end

fidget.setup();

