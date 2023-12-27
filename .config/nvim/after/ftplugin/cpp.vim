" -- vim.api.nvim_buf_set_keymap(0,
" --                             "i",
" --                             "<M-b",
" --                             [[<Esc>:w<CR>:!clang++ "%" -o %:t:r && "./%:t:r"<CR>]],
" --                             { noremap = true })
" --
" -- vim.api.nvim_buf_set_keymap(0,
" --                             "n",
" --                             "<M-b",
" --                             [[:w<CR>:!clang++ "%" -o %:t:r && "./%:t:r"<CR>]],
" --                             { noremap = true })

nnoremap <buffer> <M-f> :w<CR>:!clang-format --style=llvm -i "%"<CR>
inoremap <buffer> <M-b> <Esc>:w<CR>:!clang++ -std=c++20 "%" -o "%:p:h/%:t:r" && "%:p:h/%:t:r"<CR>
nnoremap <buffer> <M-b> :w<CR>:!clang++ -std=c++20 "%" -o "%:p:h/%:t:r" && "%:p:h/%:t:r"<CR>
nnoremap <buffer> <M-B> :w<CR>:!clang++ -std=c++20 "%" -o "%:p:h/%:t:r" && "%:p:h/%:t:r"
nnoremap <buffer> <M-C> :w<CR>:!clang++ -std=c++20 "%" -o "%:p:h/%:t:r"<CR>
