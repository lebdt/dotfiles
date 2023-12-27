-- local signs = { Error = "", Warn = "", Hint = "", Info = " " }
local signs = { Error = "󰎍", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


vim.cmd [[hi DiagnosticError ctermfg=Red]]
vim.cmd [[hi DiagnosticWarn ctermfg=214]]
vim.cmd [[hi DiagnosticInfo ctermfg=80]]
vim.cmd [[hi DiagnosticHint ctermfg=255]]
