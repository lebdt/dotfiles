require("autoclose").setup({
    options = {
      disabled_filetypes = { "text", "markdown", "" },
      disable_when_touch = true,
      touch_regex = "[%w(%[{\"\']",
      pair_spaces = true,
      auto_indent = true,
      disable_command_mode = true,
   },
})
