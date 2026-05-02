set termguicolors
set number
set fillchars+=lastline:.,eob:\ ,vert:│
set ttimeoutlen=10
syntax on

set hlsearch
set updatetime=700
set spelllang=en,pt
set norelativenumber
set autoread
set incsearch
set nospell
set splitright
set splitbelow
set noshowmode
set linebreak
set number
set scrolloff=9
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set cursorline
set cursorlineopt=number
set cmdheight=1
set signcolumn=number
set guicursor=n-c:block,i-ci-ve:ver25,v-r-cr:hor20,o:hor50
set nowrap
set shortmess=ltToOCFI
let &t_EI = "\e[2 q"  " normal mode  - solid block
let &t_SI = "\e[6 q"  " insert mode  - solid bar
let &t_SR = "\e[4 q"  " replace mode - solid underline

function! DottedTabLine()
let tabStr = ''
    for i in range(tabpagenr('$'))
        if i + 1 == tabpagenr()
            let tabStr ..= '%#TabLineSel#  ' .. '◉' .. ' '
        else
            let tabStr ..= '%#TabLine#  ' .. '○' .. ' '
        endif
    endfor
    return tabStr
endfunction | set tabline=%!DottedTabLine()


function! FullTabLine()
let tabStr = ''
    for i in range(tabpagenr('$'))
        let mod = getbufvar(tabpagebuflist(i+1)[tabpagewinnr(i+1)-1], '&mod')
        let mod_s = ' '
        if mod == 1
            let mod_s = ' [+] ' 
        endif
        if i + 1 == tabpagenr()
            let tabStr ..= '%#TabLineSel#  ' .. '◉' .. '' .. '─' .. fnamemodify(bufname(tabpagebuflist(i+1)[tabpagewinnr(i+1)-1]), ':t') .. mod_s
        else
            let tabStr ..= '%#TabLine#  ' .. '○' .. '─' .. fnamemodify(bufname(tabpagebuflist(i+1)[tabpagewinnr(i+1)-1]),':.') .. mod_s
        endif
    endfor
    return tabStr
endfunction

set tabline=%!FullTabLine()

 
" Define color variables
let g:StslineColorGreen  = "#2BBB4F"
let g:StslineColorBlue   = "#4799EB"
let g:StslineColorViolet = "#986FEC"
let g:StslineColorYellow = "#D7A542"
let g:StslineColorOrange = "#EB754D"
let g:StslineColorWhite = "#F2F2F2"
 
let g:StslineColorLight  = "#C0C0C0"
let g:StslineColorDark   = "#080808"
let g:StslineColorDark1  = "#181818"
let g:StslineColorDark2  = "#202020"
let g:StslineColorDark3  = "#081017"
 
 
" Define colors
let g:StslineBackColor   = g:StslineColorDark3
let g:StslineOnBackColor = g:StslineColorLight
"let g:StslinePriColor   = g:StslineColorGreen
let g:StslineOnPriColor  = g:StslineColorDark
let g:StslineSecColor    = g:StslineColorDark3
let g:StslineOnSecColor  = g:StslineColorLight
 
 
" Create highlight groups
execute 'highlight StslineSecColorFG guifg=' . g:StslineSecColor   ' guibg=' . g:StslineBackColor
execute 'highlight StslineSecColorBG guifg=' . g:StslineColorLight ' guibg=' . g:StslineSecColor
execute 'highlight StslineBackColorBG guifg=' . g:StslineColorLight ' guibg=' . g:StslineBackColor
execute 'highlight StslineBackColorFGSecColorBG guifg=' . g:StslineBackColor ' guibg=' . g:StslineSecColor
execute 'highlight StslineSecColorFGBackColorBG guifg=' . g:StslineSecColor ' guibg=' . g:StslineBackColor
execute 'highlight StslineModColorFG guifg=' . g:StslineColorYellow ' guibg=' . g:StslineBackColor
 
 
 
" Statusline

" Enable statusline
set laststatus=2

" Disable showmode - i.e. Don't show mode like --INSERT-- in current statusline.
set noshowmode




" Understand statusline elements

" %{StslineMode()}  = Output of a function
" %#StslinePriColorBG# = Highlight group
" %F, %c, etc. are variables which contain value like - current file path, current colums, etc.
" %{&readonly?\"\ \":\"\"} = If file is readonly ? Then "Lock icon" Else : "Nothing"
" %{get(b:,'coc_git_status',b:GitBranch)}    = If b:coc_git_status efists, then it's value, else value of b:GitBranch
" &filetype, things starting with & are also like variables with info.
" \  - Is for escaping a space. \" is for escaping a double quote.
" %{&fenc!='utf-8'?\"\ \":''}   = If file encoding is NOT!= 'utf-8' ? THEN output a "Space" else : no character 



" Define active statusline

function! ActivateStatusline()
call GetFileType()
setlocal statusline=%#StslinePriColorBorderBG#%{StslineMode()}%#StslineSecColorBG#%{get(b:,'coc_git_status',b:GitBranch)}%{get(b:,'coc_git_blame','')}%#StslinePriColorFG#\ %{&readonly?\"\ \":\"\"}%F\ %#StslineModColorFG#%{&modified?\"[+]\ \":\"\"}%=%#StslineSecColorBG#%{&fenc!='utf-8'?\"\ \":''}%{&fenc!='utf-8'?&fenc:''}%{&fenc!='utf-8'?\"\ \":''}%#StslineSecColorBG#\ %p\%%\ ･\ %#StslineSecColorBG#%l%#StslineSecColorBG#\:%c\ %#StslinePriColorBorderBG#
endfunction



" Define Inactive statusline

function! DeactivateStatusline()

if !exists("b:GitBranch") || b:GitBranch == ''
setlocal statusline=%#StslineSecColorBG#\ INACTIVE\ %#StslineSecColorBG#%{get(b:,'coc_git_statusline',b:GitBranch)}%{get(b:,'coc_git_blame','')}%#StslineBackColorFGSecColorBG#%#StslineBackColorBG#\ %{&readonly?\"\ \":\"\"}%F\ %#StslineModColorFG#%{&modified?\"[+]\ \":\"\"}%=%#StslineBackColorBG#\ %{b:FiletypeIcon}%{&filetype}\ %#StslineSecColorFGBackColorBG#%#StslineSecColorBG#\ %p\%%\ %l/%L\ :%c\ 

else
setlocal statusline=%#StslineSecColorBG#%{get(b:,'coc_git_statusline',b:GitBranch)}%{get(b:,'coc_git_blame','')}%#StslineBackColorFGSecColorBG#%#StslineBackColorBG#\ %{&readonly?\"\ \":\"\"}%F\ %#StslineModColorFG#%{&modified?\"\ \":\"\"}%=%#StslineBackColorBG#\ %{b:FiletypeIcon}%{&filetype}\ %#StslineSecColorFGBackColorBG#%#StslineSecColorBG#\ %p\%%\ %l/%L\ :%c\ 
endif

endfunction


function! WorkingDir()
  return getcwd()
endfunction

" Get Statusline mode & also set primary color for that mode
function! StslineMode()

    let l:CurrentMode=mode()

    if l:CurrentMode==#"n"
        let g:StslinePriColor     = g:StslineColorWhite
        let b:CurrentMode = "NORMAL "

    elseif l:CurrentMode==#"i"
        let g:StslinePriColor     = g:StslineColorGreen
        let b:CurrentMode = "INSERT "

    elseif l:CurrentMode==#"c"
        let g:StslinePriColor     = g:StslineColorWhite

        let b:CurrentMode = "CMD    "

    elseif l:CurrentMode==#"v"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "VISUAL  "

    elseif l:CurrentMode==#"V"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "V-LINE  "

    elseif l:CurrentMode==#"\<C-v>"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "V-BLOCK "

    elseif l:CurrentMode==#"R"
        let g:StslinePriColor     = g:StslineColorViolet
        let b:CurrentMode = "REPLACE "

    elseif l:CurrentMode==#"s"
        let g:StslinePriColor     = g:StslineColorBlue
        let b:CurrentMode = "SELECT  "

    elseif l:CurrentMode==#"t"
        let g:StslinePriColor     =g:StslineColorYellow
        let b:CurrentMode = "TERMINAL"

    elseif l:CurrentMode==#"!"
        let g:StslinePriColor     = g:StslineColorYellow
        let b:CurrentMode = "SHELL   "

    endif


    call UpdateStslineColors()
    
    return ""

endfunction



" Update colors. Recreate highlight groups with new Primary color value.
function! UpdateStslineColors()

execute 'highlight StslinePriColorBorderBG           guifg=' . g:StslineSecColor ' guibg=NONE'
execute 'highlight StslinePriColorBG           guifg=' . g:StslineOnPriColor ' guibg=' . g:StslinePriColor
execute 'highlight StslinePriColorBGBold       guifg=' . g:StslineOnPriColor ' guibg=' . g:StslinePriColor ' gui=bold'
execute 'highlight StslinePriColorFG           guifg=' . g:StslinePriColor   ' guibg=' . g:StslineSecColor
execute 'highlight StslinePriColorFGSecColorBG guifg=' . g:StslinePriColor   ' guibg=' . g:StslineSecColor
execute 'highlight StslineSecColorFGPriColorBG guifg=' . g:StslineSecColor   ' guibg=' . g:StslinePriColor

if !exists("b:GitBranch") || b:GitBranch == ''
execute 'highlight StslineBackColorFGPriColorBG guifg=' . g:StslineBackColor ' guibg=' . g:StslinePriColor
endif

endfunction



" Get git branch name

function! GetGitBranch()
let b:GitBranch=""
try
    let l:dir=expand('%:p:h')
    let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
    if !v:shell_error
        let b:GitBranch="   ".substitute(l:gitrevparse, '\n', '', 'g')." "
        execute 'highlight StslineBackColorFGPriColorBG guifg=' . g:StslineBackColor ' guibg=' . g:StslineSecColor
    endif
catch
endtry
endfunction



" Get filetype & custom icon. Put your most used file types first for optimized performance.

function! GetFileType()

if &filetype == 'typescript'
let b:FiletypeIcon = ' '

elseif &filetype == 'html'
let b:FiletypeIcon = ' '

elseif &filetype == 'scss'
let b:FiletypeIcon = ' '

elseif &filetype == 'css'
let b:FiletypeIcon = ' '

elseif &filetype == 'javascript'
let b:FiletypeIcon = ' '

elseif &filetype == 'javascriptreact'
let b:FiletypeIcon = ' '

elseif &filetype == 'markdown'
let b:FiletypeIcon = ' '

elseif &filetype == 'sh' || &filetype == 'zsh'
let b:FiletypeIcon = ' '

elseif &filetype == 'vim'
let b:FiletypeIcon = ' '

elseif &filetype == ''
let b:FiletypeIcon = ''

elseif &filetype == 'rust'
let b:FiletypeIcon = ' '

elseif &filetype == 'ruby'
let b:FiletypeIcon = ' '

elseif &filetype == 'cpp'
let b:FiletypeIcon = ' '

elseif &filetype == 'c'
let b:FiletypeIcon = ' '

elseif &filetype == 'go'
let b:FiletypeIcon = ' '

elseif &filetype == 'lua'
let b:FiletypeIcon = ' '

elseif &filetype == 'haskel'
let b:FiletypeIcon = ' '

else
let b:FiletypeIcon = ' '

endif
endfunction



" Get git branch name after entering a buffer
augroup GetGitBranch
    autocmd!
    autocmd BufEnter * call GetGitBranch()
augroup END


" Set active / inactive statusline after entering, leaving buffer
augroup SetStslineline
    autocmd!
    autocmd BufEnter,WinEnter * call ActivateStatusline()
    autocmd BufLeave,WinLeave * call DeactivateStatusline()
augroup END

" Highlights

" Color palette (xterm index -> GUI hex), 1-indexed to match Lua original
let s:xterm_to_gui = [
  \ '#282d27',
  \ '#e33232',
  \ '#b3d64e',
  \ '#ff926e',
  \ '#8085ef',
  \ '#70a553',
  \ '#8ea4f3',
  \ '#959290',
  \ '#ddd2dd',
  \ '#dd1012',
  \ '#9ac46a',
  \ '#ff926e',
  \ '#4084cc',
  \ '#a8d787',
  \ '#057272',
  \ '#ffffff',
  \ '#000000',
  \ '#00005f',
  \ '#000087',
  \ '#0000af',
  \ '#0000d7',
  \ '#0000ff',
  \ '#005f00',
  \ '#005f5f',
  \ '#005f87',
  \ '#005faf',
  \ '#005fd7',
  \ '#005fff',
  \ '#008700',
  \ '#00875f',
  \ '#008787',
  \ '#0087af',
  \ '#0087d7',
  \ '#0087ff',
  \ '#00af00',
  \ '#00af5f',
  \ '#00af87',
  \ '#00afaf',
  \ '#00afd7',
  \ '#00afff',
  \ '#00d700',
  \ '#00d75f',
  \ '#00d787',
  \ '#00d7af',
  \ '#00d7d7',
  \ '#00d7ff',
  \ '#00ff00',
  \ '#00ff5f',
  \ '#00ff87',
  \ '#00ffaf',
  \ '#00ffd7',
  \ '#00ffff',
  \ '#5f0000',
  \ '#5f005f',
  \ '#5f0087',
  \ '#5f00af',
  \ '#5f00d7',
  \ '#5f00ff',
  \ '#5f5f00',
  \ '#5f5f5f',
  \ '#5f5f87',
  \ '#5f5faf',
  \ '#5f5fd7',
  \ '#5f5fff',
  \ '#5f8700',
  \ '#5f875f',
  \ '#5f8787',
  \ '#5f87af',
  \ '#5f87d7',
  \ '#5f87ff',
  \ '#5faf00',
  \ '#5faf5f',
  \ '#5faf87',
  \ '#5fafaf',
  \ '#5fafd7',
  \ '#5fafff',
  \ '#5fd700',
  \ '#5fd75f',
  \ '#5fd787',
  \ '#5fd7af',
  \ '#5fd7d7',
  \ '#5fd7ff',
  \ '#5fff00',
  \ '#5fff5f',
  \ '#5fff87',
  \ '#5fffaf',
  \ '#5fffd7',
  \ '#5fffff',
  \ '#870000',
  \ '#87005f',
  \ '#870087',
  \ '#8700af',
  \ '#8700d7',
  \ '#8700ff',
  \ '#875f00',
  \ '#875f5f',
  \ '#875f87',
  \ '#875faf',
  \ '#875fd7',
  \ '#875fff',
  \ '#878700',
  \ '#87875f',
  \ '#878787',
  \ '#8787af',
  \ '#8787d7',
  \ '#8787ff',
  \ '#87af00',
  \ '#87af5f',
  \ '#87af87',
  \ '#87afaf',
  \ '#87afd7',
  \ '#87afff',
  \ '#87d700',
  \ '#87d75f',
  \ '#87d787',
  \ '#87d7af',
  \ '#87d7d7',
  \ '#87d7ff',
  \ '#87ff00',
  \ '#87ff5f',
  \ '#87ff87',
  \ '#87ffaf',
  \ '#87ffd7',
  \ '#87ffff',
  \ '#af0000',
  \ '#af005f',
  \ '#af0087',
  \ '#af00af',
  \ '#af00d7',
  \ '#af00ff',
  \ '#af5f00',
  \ '#af5f5f',
  \ '#af5f87',
  \ '#af5faf',
  \ '#af5fd7',
  \ '#af5fff',
  \ '#af8700',
  \ '#af875f',
  \ '#af8787',
  \ '#af87af',
  \ '#af87d7',
  \ '#af87ff',
  \ '#afaf00',
  \ '#afaf5f',
  \ '#afaf87',
  \ '#afafaf',
  \ '#afafd7',
  \ '#afafff',
  \ '#afd700',
  \ '#afd75f',
  \ '#afd787',
  \ '#afd7af',
  \ '#afd7d7',
  \ '#afd7ff',
  \ '#afff00',
  \ '#afff5f',
  \ '#afff87',
  \ '#afffaf',
  \ '#afffd7',
  \ '#afffff',
  \ '#d70000',
  \ '#d7005f',
  \ '#d70087',
  \ '#d700af',
  \ '#d700d7',
  \ '#d700ff',
  \ '#d75f00',
  \ '#d75f5f',
  \ '#d75f87',
  \ '#d75faf',
  \ '#d75fd7',
  \ '#d75fff',
  \ '#d78700',
  \ '#d7875f',
  \ '#d78787',
  \ '#d787af',
  \ '#d787d7',
  \ '#d787ff',
  \ '#d7af00',
  \ '#d7af5f',
  \ '#d7af87',
  \ '#d7afaf',
  \ '#d7afd7',
  \ '#d7afff',
  \ '#d7d700',
  \ '#d7d75f',
  \ '#d7d787',
  \ '#d7d7af',
  \ '#d7d7d7',
  \ '#d7d7ff',
  \ '#d7ff00',
  \ '#d7ff5f',
  \ '#d7ff87',
  \ '#d7ffaf',
  \ '#d7ffd7',
  \ '#d7ffff',
  \ '#ff0000',
  \ '#ff005f',
  \ '#ff0087',
  \ '#ff00af',
  \ '#ff00d7',
  \ '#ff00ff',
  \ '#ff5f00',
  \ '#ff5f5f',
  \ '#ff5f87',
  \ '#ff5faf',
  \ '#ff5fd7',
  \ '#ff5fff',
  \ '#ff8700',
  \ '#ff875f',
  \ '#ff8787',
  \ '#ff87af',
  \ '#ff87d7',
  \ '#ff87ff',
  \ '#ffaf00',
  \ '#ffaf5f',
  \ '#ffaf87',
  \ '#ffafaf',
  \ '#ffafd7',
  \ '#ffafff',
  \ '#ffd700',
  \ '#ffd75f',
  \ '#ffd787',
  \ '#ffd7af',
  \ '#ffd7d7',
  \ '#ffd7ff',
  \ '#ffff00',
  \ '#ffff5f',
  \ '#ffff87',
  \ '#ffffaf',
  \ '#ffffd7',
  \ '#ffffff',
  \ '#080808',
  \ '#121212',
  \ '#1c1c1c',
  \ '#262626',
  \ '#303030',
  \ '#3a3a3a',
  \ '#444444',
  \ '#4e4e4e',
  \ '#585858',
  \ '#626262',
  \ '#6c6c6c',
  \ '#767676',
  \ '#808080',
  \ '#8a8a8a',
  \ '#949494',
  \ '#9e9e9e',
  \ '#a8a8a8',
  \ '#b2b2b2',
  \ '#bcbcbc',
  \ '#c6c6c6',
  \ '#d0d0d0',
  \ '#dadada',
  \ '#e4e4e4',
  \ '#eeeeee',
  \ ]

" Helper: resolve xterm index (1-based) to GUI hex
function! s:G(n)
  return s:xterm_to_gui[a:n - 1]
endfunction

" ---------- highlights ----------

highlight StatusLine   ctermbg=NONE ctermfg=NONE cterm=NONE guifg=NONE guibg=NONE
highlight StatusLineNC ctermbg=NONE ctermfg=NONE cterm=NONE guifg=NONE guibg=NONE

highlight SpellBad   ctermfg=248 ctermbg=NONE cterm=underline guifg=#989898 gui=underline
highlight SpellCap   ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

highlight Folded     ctermfg=102 ctermbg=NONE

highlight ErrorMsg   ctermfg=9 ctermbg=NONE

highlight Preproc    ctermfg=81  guifg=#5fd7ff
highlight String     ctermfg=107 guifg=#87af5f
highlight Type       ctermfg=79  guifg=#00ffaf
highlight Comment    ctermfg=241 guifg=#626262 gui=italic cterm=italic
highlight Constant   ctermfg=255 guifg=#eeeeee gui=bold cterm=bold
execute 'highlight Identifier ctermfg=253 guifg=' . s:G(253)
highlight Function   ctermfg=223 guifg=#ffd7af gui=bold cterm=bold
highlight Keyword    ctermfg=209 guifg=#ff875f
highlight Exception  ctermfg=209 guifg=#ff875f
highlight Float      ctermfg=107 guifg=#87af5f
highlight Boolean    ctermfg=107 guifg=#87af5f gui=bold,italic cterm=bold,italic
highlight Conditional ctermfg=209 guifg=#ff875f
highlight Number     ctermfg=107 guifg=#87af5f
highlight Operator   ctermfg=202 guifg=#ff5f00
highlight Repeat     ctermfg=209 guifg=#ff875f
highlight Statement  ctermfg=209 guifg=#ff875f

highlight Delimiter guifg=#717171 ctermfg=DarkGray
highlight SignColumn   ctermbg=NONE guibg=NONE
highlight TabLineFill  ctermbg=NONE guibg=NONE
highlight WinSeparator ctermfg=237 ctermbg=NONE guifg=#303030 guibg=NONE
highlight VertSplit ctermfg=237 ctermbg=NONE guifg=#303030 guibg=NONE
highlight Pmenu        ctermbg=NONE cterm=NONE ctermfg=249 guibg=NONE
execute 'highlight Pmenu ctermfg=249 ctermbg=NONE guibg=NONE guifg=' . s:G(249)
highlight PmenuSel     ctermbg=240 ctermfg=252 guibg=#4e4e4e guifg=#c6c6c6
execute 'highlight Normal ctermfg=255 ctermbg=NONE guibg=NONE guifg=' . s:G(255)
execute 'highlight EndOfBuffer ctermfg=255 ctermbg=NONE guibg=NONE guifg=' . s:G(255)
execute 'highlight NormalFloat ctermfg=249 ctermbg=NONE guibg=NONE guifg=' . s:G(249)
execute 'highlight TabLineSel cterm=NONE ctermfg=253 ctermbg=NONE guibg=NONE gui=NONE guifg=' . s:G(253)
execute 'highlight TabLine ctermfg=240 ctermbg=NONE guibg=NONE guifg=' . s:G(240)
highlight Search       ctermfg=161 ctermbg=NONE cterm=bold guifg=#d70000 guibg=NONE gui=bold
execute 'highlight FloatBorder ctermfg=255 ctermbg=NONE guibg=NONE guifg=' . s:G(255)
execute 'highlight MsgArea ctermfg=180 guifg=' . s:G(180)
highlight MsgSeparator ctermbg=NONE guibg=NONE
highlight CursorLineNr cterm=bold ctermfg=220 ctermbg=NONE guibg=NONE guifg=#F5CF02
execute 'highlight LineNr cterm=NONE ctermfg=238 ctermbg=NONE gui=bold guibg=NONE guifg=' . s:G(240)
highlight NonText      cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
execute 'highlight Visual       cterm=NONE ctermfg=232 ctermbg=220 guibg=#F5CF02' . ' guifg=' . s:G(232)
execute 'highlight MatchParen ctermfg=35 cterm=bold gui=bold guifg=' . s:G(35)

" Netrw
execute 'highlight netrwClassify ctermfg=37 guifg=' . s:G(37)

" Netrw Explorer
nnoremap <Space>e :Explore<CR>
nnoremap <Space>f :Vexplore!<CR>
nnoremap <Space>s :Sexplore<CR>

" Copy to Clipboard
vnoremap <C-c> "*y
vnoremap <Space>y "*y

" Refresh Syntax Highlighting
nnoremap <M-r> :exec "set syntax=" . &filetype<CR> :exec "echo " . "\"Syntax Highlighting:\"" . &filetype<CR>

" Resize window to fit content
nnoremap <M-R> :exec "horizontal resize" line('w$')<CR> :exec "echo " . "\"Window Height Resized:\"" . line('w$') . "\"lines\""<CR>

" Tab Switcher
nnoremap <Tab> :tabnext<CR>
nnoremap ` :tabprev<CR>

" Remove Search Highlights
nnoremap <Space>/ :nohls<CR>

" Alternative Terminal Exit
tnoremap <Esc><Esc> <C-\><C-n>

" Ctrl-I workaround (most terminals send Ctrl-I as Tab)
nnoremap <C-x> <C-i>

" Join and move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J mzJ`z

" Center when jumping to next/previous search match
nnoremap n nzzzv
nnoremap N Nzzzv

" Toggle line wrap
nnoremap <Space>w :set wrap!<CR>

" Move up and down visually. Not linewise
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Tmux Navigator
" Maps <C-h/j/k/l> to switch vim splits in the given direction. If there are no more windows in that direction, forwards the operation to tmux.
" Additionally, <C-\> toggles between last active vim splits/tmux panes.

if exists("g:loaded_tmux_navigator") || &cp || v:version < 700
  finish
endif
let g:loaded_tmux_navigator = 1

function! s:VimNavigate(direction)
  try
    execute 'wincmd ' . a:direction
  catch
    echohl ErrorMsg | echo 'E11: Invalid in command-line window; <CR> executes, CTRL-C quits: wincmd k' | echohl None
  endtry
endfunction

if !get(g:, 'tmux_navigator_no_mappings', 0)
  nnoremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
  nnoremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
  nnoremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
  nnoremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
  nnoremap <silent> <c-\> :<C-U>TmuxNavigatePrevious<cr>

  if !empty($TMUX)
    function! IsFZF()
      return &ft == 'fzf'
    endfunction
    tnoremap <expr> <silent> <C-h> IsFZF() ? "\<C-h>" : "\<C-w>:\<C-U> TmuxNavigateLeft\<cr>"
    tnoremap <expr> <silent> <C-j> IsFZF() ? "\<C-j>" : "\<C-w>:\<C-U> TmuxNavigateDown\<cr>"
    tnoremap <expr> <silent> <C-k> IsFZF() ? "\<C-k>" : "\<C-w>:\<C-U> TmuxNavigateUp\<cr>"
    tnoremap <expr> <silent> <C-l> IsFZF() ? "\<C-l>" : "\<C-w>:\<C-U> TmuxNavigateRight\<cr>"
  endif

  if !get(g:, 'tmux_navigator_disable_netrw_workaround', 0)
    if !exists('g:Netrw_UserMaps')
      let g:Netrw_UserMaps = [['<C-l>', '<C-U>TmuxNavigateRight<cr>']]
    else
      echohl ErrorMsg | echo 'vim-tmux-navigator conflicts with netrw <C-l> mapping. See https://github.com/christoomey/vim-tmux-navigator#netrw or add `let g:tmux_navigator_disable_netrw_workaround = 1` to suppress this warning.' | echohl None
    endif
  endif
endif

if empty($TMUX)
  command! TmuxNavigateLeft call s:VimNavigate('h')
  command! TmuxNavigateDown call s:VimNavigate('j')
  command! TmuxNavigateUp call s:VimNavigate('k')
  command! TmuxNavigateRight call s:VimNavigate('l')
  command! TmuxNavigatePrevious call s:VimNavigate('p')
  finish
endif

command! TmuxNavigateLeft call s:TmuxAwareNavigate('h')
command! TmuxNavigateDown call s:TmuxAwareNavigate('j')
command! TmuxNavigateUp call s:TmuxAwareNavigate('k')
command! TmuxNavigateRight call s:TmuxAwareNavigate('l')
command! TmuxNavigatePrevious call s:TmuxAwareNavigate('p')

if !exists("g:tmux_navigator_save_on_switch")
  let g:tmux_navigator_save_on_switch = 0
endif

if !exists("g:tmux_navigator_disable_when_zoomed")
  let g:tmux_navigator_disable_when_zoomed = 0
endif

if !exists("g:tmux_navigator_preserve_zoom")
  let g:tmux_navigator_preserve_zoom = 0
endif

if !exists("g:tmux_navigator_no_wrap")
  let g:tmux_navigator_no_wrap = 0
endif

let s:pane_position_from_direction = {'h': 'left', 'j': 'bottom', 'k': 'top', 'l': 'right'}

function! s:TmuxOrTmateExecutable()
  return (match($TMUX, 'tmate') != -1 ? 'tmate' : 'tmux')
endfunction

function! s:TmuxVimPaneIsZoomed()
  return s:TmuxCommand("display-message -p '#{window_zoomed_flag}'") == 1
endfunction

function! s:TmuxSocket()
  " The socket path is the first value in the comma-separated list of $TMUX.
  return split($TMUX, ',')[0]
endfunction

function! s:TmuxCommand(args)
  let cmd = s:TmuxOrTmateExecutable() . ' -S ' . s:TmuxSocket() . ' ' . a:args
  let l:x=&shellcmdflag
  let &shellcmdflag='-c'
  let retval=system(cmd)
  let &shellcmdflag=l:x
  return retval
endfunction

function! s:TmuxNavigatorProcessList()
  echo s:TmuxCommand("run-shell 'ps -o state= -o comm= -t ''''#{pane_tty}'''''")
endfunction
command! TmuxNavigatorProcessList call s:TmuxNavigatorProcessList()

let s:tmux_is_last_pane = 0
augroup tmux_navigator
  au!
  autocmd WinEnter * let s:tmux_is_last_pane = 0
augroup END

function! s:NeedsVitalityRedraw()
  return exists('g:loaded_vitality') && v:version < 704 && !has("patch481")
endfunction

function! s:ShouldForwardNavigationBackToTmux(tmux_last_pane, at_tab_page_edge)
  if g:tmux_navigator_disable_when_zoomed && s:TmuxVimPaneIsZoomed()
    return 0
  endif
  return a:tmux_last_pane || a:at_tab_page_edge
endfunction


function! s:TmuxAwareNavigate(direction)
  let nr = winnr()
  let tmux_last_pane = (a:direction == 'p' && s:tmux_is_last_pane)
  if !tmux_last_pane
    call s:VimNavigate(a:direction)
  endif
  let at_tab_page_edge = (nr == winnr())
  " Forward the switch panes command to tmux if:
  " a) we're toggling between the last tmux pane;
  " b) we tried switching windows in vim but it didn't have effect.
  if s:ShouldForwardNavigationBackToTmux(tmux_last_pane, at_tab_page_edge)
    if g:tmux_navigator_save_on_switch == 1
      try
        update " save the active buffer. See :help update
      catch /^Vim\%((\a\+)\)\=:E32/ " catches the no file name error
      endtry
    elseif g:tmux_navigator_save_on_switch == 2
      try
        wall " save all the buffers. See :help wall
      catch /^Vim\%((\a\+)\)\=:E141/ " catches the no file name error
      endtry
    endif
    let args = 'select-pane -t ' . shellescape($TMUX_PANE) . ' -' . tr(a:direction, 'phjkl', 'lLDUR')
    if g:tmux_navigator_preserve_zoom == 1
      let l:args .= ' -Z'
    endif
    if g:tmux_navigator_no_wrap == 1 && a:direction != 'p'
      let args = 'if -F "#{pane_at_' . s:pane_position_from_direction[a:direction] . '}" "" "' . args . '"'
    endif
    silent call s:TmuxCommand(args)
    if s:NeedsVitalityRedraw()
      redraw!
    endif
    let s:tmux_is_last_pane = 1
  else
    let s:tmux_is_last_pane = 0
  endif
endfunction

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>
nnoremap <silent> <C-p> :<C-U>TmuxNavigatePrevious<cr>
