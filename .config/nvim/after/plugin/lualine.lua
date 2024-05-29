local colors = {
  -- green      = '#63D58A',
  green      = 78,
  black      = 235,
  white      = 255,
  red        = '#ff5189',
  lightgrey  = 250,
  activebg   = 0,
  inactivefg = 238,
  inactivebg = NONE,
}


local mytheme = {
  normal = {
    a = { fg = colors.lightgrey, bg = colors.activebg, gui=NONE },
    b = { fg = colors.white, bg = colors.activebg },
    -- c = { fg = colors.white, bg = colors.activebg },
  },

  insert  = { b = { fg = colors.green, bg = colors.activebg, gui = 'bold' } },
  visual  = { b = { fg = colors.white, bg = colors.activebg, gui = 'bold' } },
  replace = { b = { fg = colors.red,   bg = colors.activebg, gui = 'bold' } },

  inactive = {
    a = { fg = colors.inactivefg, bg = colors.inactivebg },
    b = { fg = colors.inactivefg, bg = colors.inactivebg },
  },
}

-- Highlight Groups to match lualine background
-- See ~/.config/nvim/after/plugin/diagnostics.lua
local errorHi = "hi DiagnosticErrorPlusBG ctermbg=" .. colors.activebg .. " ctermfg=Red"
local warnHi  = "hi DiagnosticWarnPlusBG ctermbg="  .. colors.activebg .. " ctermfg=214"
local infoHi  = "hi DiagnosticInfoPlusBG ctermbg="  .. colors.activebg .. " ctermfg=80"
local hintHi  = "hi DiagnosticHintPlusBG ctermbg="  .. colors.activebg .. " ctermfg=255"

vim.cmd(errorHi)
vim.cmd(warnHi)
vim.cmd(infoHi)
vim.cmd(hintHi)


if vim.g.neovide then
local activebg = '#010101'
  mytheme.normal = {
    a = { fg = "#aeaeae",     bg=activebg },
    b = { fg = "#dfdfdf", bg=activebg },
    c = { fg = "#909090", bg=activebg },
    -- a = { fg = colors.white, bg="#12171f", gui='bold' },
    -- b = { fg = colors.lightgrey, bg="#12171f" },
  }
  mytheme.insert  = { b = { fg = colors.green, bg = activebg, gui = 'bold' } }
  mytheme.visual  = { b = { fg = colors.white, bg = activebg, gui = 'bold' } }
  mytheme.replace = { b = { fg = colors.red,   bg = activebg, gui = 'bold' } }
end

local function CWD()
  local dir = vim.fn.getcwd()
  local home_dir = os.getenv('HOME')
  return dir:gsub(home_dir, ""):gsub("/", " ･ ")
end

local function folderIcon()
  if CWD() == "" then
    return ''
  elseif CWD() == " ･ " then
    return ''
  else
    return '󱦰'
  end
end


function Section_a_modifier(test)
  local section;
  if test == true then
    section = {
      {CWD, separator = { left = '' }, left_padding = 2 },
      {folderIcon, left_padding = 2 },
    }
  else
    section = {}
  end
  return section
end




require('lualine').setup {
  options = {
    theme = mytheme,
    component_separators = '･',
    section_separators = {},
  },
  sections = {
    lualine_a = Section_a_modifier(vim.g.showCWD),
    lualine_b = {{
      'filename',
      separator = {
        left = '',
      },
      file_status = true,
      newfile_status = false,
      path = 1,
      shorting_target = 40,
      symbols = {
        modified = '[+]',
        readonly = '[-]',
        unnamed = '[No Name]',
        newfile = '[New]',
      }
    },
      'branch' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
      -- {folderIcon, separator = { right = '' }, left_padding = 2 },
      -- {CWD, separator = { right = '' }, left_padding = 2 },
    },
    lualine_z = {
        {
          'diagnostics',
          symbols = { error = "󰎍 ", warn = " ", hint = " ", info = " " },
          diagnostics_color = {
            error = 'DiagnosticErrorPlusBG',
            warn  = 'DiagnosticWarnPlusBG',
            info  = 'DiagnosticInfoPlusBG',
            hint  = 'DiagnosticHintPlusBG',
            }
        },
        -- 'encoding',
        {
          'filetype',
          colored = false,
          icon_only = true,
          icon = { 'X', align = 'right' }
        },
        'progress',
        {
            'location',
            separator = { right = '' },
        }
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
