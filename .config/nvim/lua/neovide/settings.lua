if vim.g.neovide then
vim.cmd[[cd ~]]

vim.g.neovide_transparency = 1
vim.g.transparency = 0
vim.cmd[[hi Normal guibg=#0f1117]]
vim.cmd[[hi Visual guibg=#808885]]
vim.cmd[[hi Diagnostic guibg=#808885]]
vim.cmd[[hi DiagnosticErrorPlusBG guibg=Black]]
vim.cmd[[hi DiagnosticWarnPlusBG  guibg=Black]]
vim.cmd[[hi DiagnosticInfoPlusBG  guibg=Black]]
vim.cmd[[hi DiagnosticHintPlusBG  guibg=Black]]

vim.g.neovide_padding_top = 30
vim.g.neovide_padding_bottom = 1
vim.g.neovide_padding_right = 28
vim.g.neovide_padding_left = 30
vim.g.neovide_hide_mouse_when_typing = true

vim.o.guifont = "RobotoMono Nerd Font Mono:w-1:h" .. vim.g.neovideFontSize .. ":#e-antialias:#h-none"
-- vim.opt.titlestring = [[ %{substitute(substitute(expand('%:p'), "/"," ",""),"/", " ∙ ","g")} ]]
vim.opt.title = true
vim.opt.titlestring = [[ %{expand('%:p')} ]]
vim.opt.linespace = 0
vim.g.neovide_input_macos_alt_is_meta = true
vim.keymap.set('n', '<D-s>', ':w<CR>')
vim.keymap.set('v', '<D-c>', '"+y')
-- vim.keymap.set('n', '<C-v>', '<Esc>"+p')
-- vim.keymap.set('v', '<C-v>', '"+p')
vim.keymap.set('c', '<D-v>', '<C-R>+')
vim.keymap.set('i', '<D-v>', '<ESC>"+pi')
vim.keymap.set('i', '<C-v>', '<ESC>"+pi')
-- Allow clipboard copy paste in neovim
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_cursor_trail_size = 0.1
vim.g.neovide_remember_window_position = true
vim.g.neovide_remember_window_size = false


-- vim.api.nvim_set_keymap('',  '<D-v>', '+p<CR>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.g.neovide_scale_factor = 1.0

local increaseFontSize = function(delta)
  vim.g.neovideFontSize = vim.g.neovideFontSize * delta
  vim.cmd "source /Users/ebd/.config/nvim/lua/neovide/settings.lua"
end

local decreaseFontSize = function(delta)
  increaseFontSize(1/delta)
end

-- local change_scale_factor = function(delta)
--   vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
-- end

vim.keymap.set("i", "<D-=>", function()
  increaseFontSize(1.10)
end)
vim.keymap.set("n", "<D-=>", function()
  increaseFontSize(1.10)
end)

vim.keymap.set("n", "<D-->", function()
  decreaseFontSize(1.10)
end)
vim.keymap.set("i", "<D-->", function()
  decreaseFontSize(1.10)
end)


end
