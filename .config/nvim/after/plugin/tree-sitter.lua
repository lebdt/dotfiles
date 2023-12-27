local api = vim.api

require'nvim-treesitter.configs'.setup {
  autotag = { enable = true, enable_close_on_slash = false, }, -- Autotag Extension
  ensure_installed = {},
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
}


api.nvim_set_hl(0, "@boolean", { fg="#87af5f", ctermfg=107, italic=true, bold=true, })
api.nvim_set_hl(0, "@comment", { fg="#626262", ctermfg=241, italic=true, })
api.nvim_set_hl(0, "@conditional", { fg="#ff875f", ctermfg=209 })
api.nvim_set_hl(0, "@constructor", { fg="#ffd7d7" })
api.nvim_set_hl(0, "@constant", { fg="#eeeeee", ctermfg=255, bold=true, })
api.nvim_set_hl(0, "@constant.builtin", { fg="#4950f0", ctermfg=4 })
api.nvim_set_hl(0, "@exception", { fg="#ff875f", ctermfg=209 })
api.nvim_set_hl(0, "@field", { fg="#b2b2b2", ctermfg=249 })
api.nvim_set_hl(0, "@float", { fg="#87af5f", ctermfg=107 })
api.nvim_set_hl(0, "@function", { fg="#ffd7af", ctermfg=223, bold=true, })
api.nvim_set_hl(0, "@function.builtin", { fg="#ffd700", ctermfg=220 })
api.nvim_set_hl(0, "@keyword", { fg="#ff875f", ctermfg=209 })
api.nvim_set_hl(0, "@method", { fg="#ffd7af", ctermfg=223 })
api.nvim_set_hl(0, "@namespace", { fg="#d7d7d7", ctermfg=188, italic=true, })
api.nvim_set_hl(0, "@number", { fg="#87af5f", ctermfg=107 })
api.nvim_set_hl(0, "@operator", { fg="#ff5f00", ctermfg=202 })
api.nvim_set_hl(0, "@parameter", { fg="#ffffd7", ctermfg=230, italic=true, })
api.nvim_set_hl(0, "@punctuation", { fg="#949494", ctermfg=246, bold=true, })
api.nvim_set_hl(0, "@repeat", { fg="#ff875f", ctermfg=209 })
api.nvim_set_hl(0, "@string", { fg="#87af5f", ctermfg=107 })
api.nvim_set_hl(0, "@type", { fg="#00ffaf", ctermfg=49 })
api.nvim_set_hl(0, "@tag", { fg="#ae2335", ctermfg=204 })
api.nvim_set_hl(0, "@tag.delimiter", { fg="#808080", ctermfg=242 })
api.nvim_set_hl(0, "@tag.attribute", {  fg="#ff875f", ctermfg=209 })
api.nvim_set_hl(0, "@variable", { fg="#e4e4e4", ctermfg=254 })
