require("remaps.undo-tree")
require("remaps.iterm")
require("remaps.telescope")
require("remaps.diagnostics")
require("remaps.lsp")

local api = vim.api


-- Netrw Explorer
api.nvim_set_keymap("n", "<space>e", "<cmd>Explore<CR>", { noremap = true })
api.nvim_set_keymap("n", "<space>f", "<cmd>Vexplore!<CR>", { noremap = true })
api.nvim_set_keymap("n", "<space>s", "<cmd>Sexplore<CR>", { noremap = true })

-- Copy to Clipboard
api.nvim_set_keymap("v", "<C-c>", '"*y', { noremap = true })
api.nvim_set_keymap("v", "<Space>y", '"*y', { noremap = true }) -- This one copies to clipboard and default register so pasting with "p/P" also works

-- Send to Terminal Buffer (More used in Rlang Setups)
api.nvim_set_keymap("n", "<M-T>", [[<cmd>let Channel = &channel<CR> | :echo "Channel =" &channel<CR>]], { noremap = true }) -- Assign Current Terminal channel to 'Channel' variable
api.nvim_set_keymap("n", "<M-U>", [[:.y | call chansend(Channel, @")<CR><CR>]], { noremap = true })
api.nvim_set_keymap("v", "<M-U>", [[:y | call chansend(Channel, @")<CR><CR>]], { noremap = true })

-- Faster Window Navigation (Replaced by vim-tmux-navigator)
-- api.nvim_set_keymap("n", "<C-h>", "<cmd>wincmd h<CR>", { noremap = true })
-- api.nvim_set_keymap("n", "<C-j>", "<cmd>wincmd j<CR>", { noremap = true })
-- api.nvim_set_keymap("n", "<C-k>", "<cmd>wincmd k<CR>", { noremap = true })
-- api.nvim_set_keymap("n", "<C-l>", "<cmd>wincmd l<CR>", { noremap = true })

-- Refresh FileType (I thought of it as useful when working with multiple filetypes at once)
-- PS: Solved by adding the <buffer> scope on filetype api.nvim_set_keymappings
-- api.nvim_set_keymap("n", "<M-r>", [[<cmd>exec "set ft=" . &filetype<CR> | <cmd>exec "echo " . "\"FileType Refreshed:\"" ."&filetype" <CR>]])
api.nvim_set_keymap("n", "<M-r>", [[<cmd>exec "set syntax=" . &filetype<CR> | :exec "echo " . "\"Syntax Highlighting:\"" ."&filetype" <CR>]], { noremap = true })
api.nvim_set_keymap("n", "<M-R>", [[<cmd>exec "horizontal resize" line('w$')<CR> | :exec "echo " . "\"Window Height Resized:\"" . line('w$') "\"lines\""<CR>]], { noremap = true })

-- Tab Switcher
api.nvim_set_keymap("n", "<tab>",   "<cmd>tabnext<cr>", { noremap = true })
api.nvim_set_keymap("n", "`", "<cmd>tabprev<cr>", { noremap = true })

-- Remove Search Highlights
api.nvim_set_keymap("n", "<space>/", "<cmd>nohls<cr>", { noremap = true })

-- Alternative Terminal Exit
api.nvim_set_keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true })

-- Crtl-I sends <Tab> to most Terminal Emulators
-- Remapping Ctrl-Shift-O to Ctrl-O seems reasonable
-- as long as the terminal supports distinction between them
api.nvim_set_keymap("n", "<C-x>", "<C-i>", { noremap = true })

-- Join and move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

-- Center when jumping from current to next/previous search match
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Jump to next and previous diagnostic
vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "g]", vim.diagnostic.goto_next, {})
