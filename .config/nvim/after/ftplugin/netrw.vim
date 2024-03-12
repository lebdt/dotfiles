setlocal syntax=netrw
setlocal cursorlineopt=screenline
setlocal signcolumn=yes
highlight CursorLine ctermfg=232 cterm=bold ctermbg=78 gui=bold guifg=NONE guibg=NONE

" nnoremap <buffer> <c-r> <c-l>
nnoremap <buffer> <c-l> <cmd>TmuxNavigateRight<CR>
" nnoremap <buffer> <c-h> <c-w>h
