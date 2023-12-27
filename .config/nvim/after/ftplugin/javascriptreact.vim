setlocal tabstop=2
setlocal shiftwidth=2

nnoremap <buffer> <M-f> :w<CR>:!npx prettier "%:p" --write<CR>
