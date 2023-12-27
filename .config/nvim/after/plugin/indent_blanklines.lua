-- require("indent_blankline").setup {
--     char = "▏",
--     context_char = '▏',
--     space_char_blankline = ' ',
--     show_current_context = false,
--     show_current_context_start = false,
-- }
--
--
-- vim.api.nvim_set_hl(0, "IndentBlanklineChar", { ctermfg=236, fg=236 })
-- vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { ctermfg=238, fg=238 })
--


vim.api.nvim_set_hl(0, "CustomIBLhl", { ctermfg=236, fg="#262626", bold=false })

require("ibl").setup({
  indent = { highlight = {"CustomIBLhl"}, char = "▏" },
    whitespace = {
        highlight = {"CustomIBLhl"},
        remove_blankline_trail = false,
    },
  scope = { enabled = false },
})

-- api.nvim_set_hl(0, "IBLWhitespace", { ctermfg=236, fg=236, bold=false })
-- api.nvim_set_hl(0, "IBLScope", { ctermfg=236, fg=236, bold=false })
-- api.nvim_set_hl(0, "IBLIndent", { ctermfg=236, fg=236, bold=false })
