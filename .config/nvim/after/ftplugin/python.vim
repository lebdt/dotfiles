" vim.api.nvim_buf_set_keymap(0, "i", "<M-b", [[<Esc>:w<CR>:!python3 "%"<CR>]], { noremap = true })
" vim.api.nvim_buf_set_keymap(0, "n", "<M-b", [[:w<CR>:!python3 "%"<CR>]], { noremap = true })
" vim.api.nvim_buf_set_keymap(0, "n", "<M-B", [[:w<CR>:!python3 "%"]], { noremap = true })

inoremap <buffer> <M-b> <Esc>:w<CR>:!python3 "%"<CR>
nnoremap <buffer> <M-b> :w<CR>:!python3 "%"<CR>
nnoremap <buffer> <M-B> :w<CR>:!python3 "%" 
nnoremap <buffer> <M-F> :w<CR>:!black "%"<CR>
