if vim.loader then
  vim.loader.enable()
end

local g = vim.g
local opt = vim.opt
local opt_local = vim.opt_local
local cmd = vim.cmd
local api = vim.api
local fn = vim.fn
local loop = vim.loop


g.mapleader = " "

g.netrw_banner = 0
g.netrw_altv = true
g.mapleader = " "

opt.mouse = {}
opt.foldmethod = "indent"
opt.foldenable = false
opt.swapfile = false
opt.backup = false
opt.undofile = true

if vim.fn.has('win32') == 1 or vim.fn.has('win32unix') == 1 then 
  vim.opt.undodir = "~/AppData/Local/nvim-data/undodir"
else
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end

-- opt.updatetime = 900
opt.autoread = true
opt.incsearch = false
opt.spell = false
opt.splitright = true
opt.splitbelow = true
opt.showmode = false
opt.linebreak = true
opt.number = true
opt.scrolloff = 9
opt.ignorecase = true
opt.smartcase = true
opt.fillchars='lastline:.,eob: '
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.cursorline = true
opt.cursorlineopt = 'number'
opt.laststatus = 3
opt.cmdheight = 1
opt.signcolumn = 'number'
opt.mousescroll = "ver:2"
opt.guicursor = "n-c:block,i-ci-ve:ver25,v-r-cr:hor20,o:hor50"
opt.wrap = false
opt.termguicolors = false

api.nvim_command('syntax manual')

cmd [[
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


cmd [[
function! FullTabLine()
let tabStr = ''
    for i in range(tabpagenr('$'))
        if i + 1 == tabpagenr()
            let tabStr ..= '%#TabLineSel#  ' .. '◉' .. '' .. '─' .. fnamemodify(bufname(tabpagebuflist(i+1)[tabpagewinnr(i+1)-1]), ':t') .. ' '
        else
            let tabStr ..= '%#TabLine#  ' .. '○' .. '─' .. bufname(tabpagebuflist(i+1)[tabpagewinnr(i+1)-1]) .. ' '
        endif
    endfor
    return tabStr
endfunction
]]

api.nvim_create_user_command('DottedTabLine', 'set tabline=%!DottedTabLine()',{})
api.nvim_create_user_command('FullTabLine', 'set tabline=%!FullTabLine()',{})

function NoteMode()
  opt_local.titlestring = "⠀"
  opt_local.laststatus = 0
  opt_local.cmdheight = 0
  opt_local.number = false
  opt_local.wrap = true
  opt_local.syntax ="markdown"
  opt_local.guicursor ="n-v:hor1,i:ver1-blinkon1"
  opt_local.scrolloff = 0
  opt_local.shortmess ="aostcS"
  opt_local.spell = true
end

api.nvim_create_user_command('NoteMode', 'cd ~/Documents/NoteMode | lua NoteMode()',{})

vim.api.nvim_create_autocmd("CmdlineLeave", {
	callback = function()
		vim.fn.timer_start(2000, function()
			print(" ")
		end)
	end
})

vim.o.statusline = ""

vim.g.showCWD = true

function toggle_cwd()
  vim.g.showCWD = not vim.g.showCWD
end

api.nvim_create_user_command("ToggleCWD", [[exec "lua toggle_cwd()" | source  ~/.config/nvim/after/plugin/lualine.lua]], {})


-- Lazy Package Manager Setup
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not loop.fs_stat(lazypath) then
  fn.system({
    "git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable",
    lazypath,
  })
end
opt.rtp:prepend(lazypath)
require("lazy").setup("lazy.plugins", {
  ui = {
    border = 'rounded',
  },
})


vim.api.nvim_create_autocmd({"TermEnter"}, {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
  end,
})



if vim.g.neovide then
    vim.g.neovideFontSize = 16.0
    require("neovide.settings")
end

require("remaps.general")

-- vim.api.nvim_create_user_command('Redir', function(ctx)
--   local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
--   vim.cmd('new')
--   vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
--   vim.opt_local.modified = false
-- end, { nargs = '+', complete = 'command' })
