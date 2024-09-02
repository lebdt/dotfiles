-- if vim.loader then
--   vim.loader.enable()
-- end

vim.g.mapleader = " "

vim.g.netrw_banner = 0
vim.g.netrw_altv = true
vim.g.mapleader = " "

vim.opt.mouse = {}
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

if vim.fn.has('win32') == 1 or vim.fn.has('win32unix') == 1 then
  vim.opt.undodir = "~/AppData/Local/nvim-data/undodir"
else
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end

vim.opt.updatetime = 700
vim.opt.spelllang = "en,pt"
vim.opt.relativenumber = true
vim.opt.autoread = true
vim.opt.incsearch = true
vim.opt.spell = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showmode = false
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.scrolloff = 9
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.fillchars='lastline:.,eob: '
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.signcolumn = 'number'
vim.opt.mousescroll = "ver:2"
vim.opt.guicursor = "n-c:block,i-ci-ve:ver25,v-r-cr:hor20,o:hor50"
vim.opt.wrap = false
vim.opt.termguicolors = false
vim.opt.shortmess ="ltToOCFI"

vim.api.nvim_command('syntax manual')

vim.cmd [[
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
]]


vim.cmd [[
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
]]


vim.cmd [[
function! RegexOr()
try
  :%s;/$;;
finally
  :%s;\n;|;
  :%s;^;(;
  :%s;.$;);
endtry
endfunction
]]

vim.api.nvim_create_user_command('DottedTabLine', 'set tabline=%!DottedTabLine()',{})
vim.api.nvim_create_user_command('FullTabLine', 'set tabline=%!FullTabLine()',{})
vim.api.nvim_create_user_command('RegexOr', 'call RegexOr()',{})

function NoteMode()
  vim.opt_local.statusline = ""
  vim.opt_local.titlestring = "⠀"
  vim.opt_local.laststatus = 0
  vim.opt_local.cmdheight = 0
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.wrap = true
  vim.opt_local.syntax ="markdown"
  vim.opt_local.guicursor ="n-v:hor1,i:ver1-blinkon1"
  vim.opt_local.scrolloff = 0
  vim.opt_local.shortmess ="aostTcSOWCF"
  vim.opt_local.spell = true
end

vim.api.nvim_create_user_command('NoteMode', 'cd ~/Documents/NoteMode | lua NoteMode()',{})

vim.api.nvim_create_autocmd("CmdlineLeave", {
	callback = function()
		vim.fn.timer_start(2000, function()
			print(" ")
		end)
	end
})

vim.o.statusline = ""

vim.g.showCWD = true

function Toggle_cwd()
  vim.g.showCWD = not vim.g.showCWD
end

vim.api.nvim_create_user_command("ToggleCWD", [[exec "lua Toggle_cwd()" | source  ~/.config/nvim/after/plugin/lualine.lua]], {})


-- Lazy Package Manager Setup

  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  -- if not vim.loop.fs_stat(lazypath) then
  --   vim.fn.system({
  --     "git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable",
  --     lazypath,
  --   })
  -- end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("lazy.plugins", {
  ui = {
    border = 'rounded',
  },
})


vim.api.nvim_create_autocmd({"TermEnter"}, {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})



if vim.g.neovide then
    vim.g.neovideFontSize = 18.0
    require("neovide.settings")
end

require("remaps.general")

vim.cmd [[
func! Init_groups_from_colors()
    let colors = [ 'red', 'green', 'blue', 'magenta', 'NONE', 'darkred', 'darkblue', 'darkgreen', 'darkmagenta', 'darkcyan' ]
    for ci in range(len(colors))
        let cmd = 'highlight column%d ctermfg=%s guifg=%s'
        exe printf(cmd, ci, colors[ci], colors[ci])
        let cmd = 'highlight escaped_column%d ctermfg=%s guifg=%s'
        exe printf(cmd, ci, colors[ci], colors[ci])
    endfor
endfunc

call Init_groups_from_colors()
]]

-- vim.api.nvim_create_user_command('Redir', function(ctx)
--   local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
--   vim.cmd('new')
--   vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
--   vim.vim.opt_local.modified = false
-- end, { nargs = '+', complete = 'command' })
