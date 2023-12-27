local api = vim.api
-- -- (M => Cmd)
api.nvim_set_keymap("n", "<M-s>", ":w<CR>", { noremap = true })
api.nvim_set_keymap("i", "<M-s>", "<Esc> :w<CR>", { noremap = true })
api.nvim_set_keymap("i", "<M-z>", "<Esc>u", { noremap = true })
api.nvim_set_keymap("v", "<M-z>", "<Esc>u", { noremap = true })
api.nvim_set_keymap("n", "<M-z>", "u", { noremap = true })
api.nvim_set_keymap("i", "<M-Z>", "<Esc><C-r>", { noremap = true })
api.nvim_set_keymap("v", "<M-Z>", "<Esc><C-r>", { noremap = true })
api.nvim_set_keymap("n", "<M-Z>", "<C-r>", { noremap = true })
-- api.nvim_set_keymap("i", "<C-BS>", "<Esc>cvb", { noremap = true })

-- -- M => Ctrl+Option
api.nvim_set_keymap("n", "<M-J>", "<cmd>m+<CR>==", { noremap = true })
api.nvim_set_keymap("n", "<M-K>", "<cmd>m-2<CR>==", { noremap = true })
api.nvim_set_keymap("i", "<M-J>", "<Esc><cmd>m+<CR>==", { noremap = true })
api.nvim_set_keymap("i", "<M-K>", "<Esc><cmd>m-2<CR>==", { noremap = true })
