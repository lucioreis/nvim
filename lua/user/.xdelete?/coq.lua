local ok, coq = pcall(require, "coq")
if not ok then
  print("Coq not loaded")
  return
end

coq.Now()
vim.g.coq_settings = {
  ["display.ghost_text.enabled"] = true,
  ["display.ghost_text.context"] = {"", ""},
  ["display.pum.kind_context"] = {"[","]"},
  ["display.pum.source_context"] = {"|", "|"},
  ["display.preview.border"] = "solid"
}



