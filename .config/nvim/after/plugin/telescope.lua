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
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
  }
}
})

vim.api.nvim_set_hl(0, "TelescopeSelection", { ctermfg=78, fg="#5fd787", ctermbg=237, bold=false })

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
