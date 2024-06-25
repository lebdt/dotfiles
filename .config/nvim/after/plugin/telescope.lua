require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ['<C-p>'] = require('telescope.actions.layout').toggle_preview
      }
    },
    preview = {
      hide_on_startup = true -- hide previewer when picker starts
    },
    path_display = { "filename_first" },
    selection_caret = "❯ ",
    prompt_prefix = " ",
  }
})

vim.api.nvim_set_hl(0, "TelescopeSelection", { ctermfg=78, fg="#5fd787", ctermbg=237, bold=false })
