set syntax=tex
setlocal wrap

nnoremap <buffer> j gj
nnoremap <buffer> k gk
nnoremap <buffer> <M-b> :w<CR><cmd>silent execute "!mkdir -p output && lualatex --output-directory=output ./main.tex"<CR><cmd>execute "echo " . "\'Finished Building\'"<CR>
nnoremap <buffer> <M-o> :!open ./output/main.pdf<CR>
