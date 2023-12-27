" vim.api.nvim_buf_set_keymap(0, "i", "<M-b", [[<Esc>:w<CR>:!rustc "%" && "./%:t:r"<CR>]], { noremap = true })
" vim.api.nvim_buf_set_keymap(0, "n", "<M-b", [[<Esc>:w<CR>:!rustc "%" && "./%:t:r"<CR>]], { noremap = true })
" vim.api.nvim_buf_set_keymap(0, "n", "<M-B", [[:!cargo run<CR>]], { noremap = true })


inoremap <buffer> <M-b> <Esc>:w<CR>:!rustc "%:p" && "%:p:h/%:t:r"<CR>
nnoremap <buffer> <M-b> :w<CR>:!rustc "%:p" && "%:p:h/%:t:r"<CR>
nnoremap <buffer> <M-B> :!cargo run<CR>
