local box_styleStatus = false
local decorated = false
local api = vim.api
local fn = vim.fn
local cmd = vim.cmd
local global = vim.g

local cardColors = {
  bg = NONE,
  -- bg = 'black',
  fg = 237,
  gui_fg = '#303030',
  gui_bg = NONE,
}

if box_styleStatus == false then
  api.nvim_set_hl(0, "VirtualFilenameTextNB", { bold=false, fg=cardColors.gui_fg, bg=cardColors.gui_bg, ctermfg=cardColors.fg, ctermbg=cardColors.bg })
  api.nvim_set_hl(0, "VirtualFilenamePadNB", { ctermfg=cardColors.bg, ctermbg=NONE, fg=cardColors.gui_bg })
else
  api.nvim_set_hl(0, "VirtualFilenameText", { ctermfg=cardColors.fg, ctermbg=NONE, bg=NONE, fg=cardColors.fg })
  api.nvim_set_hl(0, "VirtualFilenameBox", { ctermfg=cardColors.fg, fg=cardColors.fg })
end


local function deleteVirtualFilenameByWinID(winID, boxed_style)
  local box_style = boxed_style or false
  local bnr = fn.winbufnr(winID)
  local ns_id = api.nvim_create_namespace('virtualTextFilename' .. bnr)
  local id = bnr
  local eobLine = fn.line('w$', winID)
  local winHeight = fn.winheight(winID)
  if box_style == true then
    if eobLine >= 3 and winHeight > 1 then
      api.nvim_buf_del_extmark(bnr, ns_id, id)
      api.nvim_buf_del_extmark(bnr, ns_id, id+800)
      api.nvim_buf_del_extmark(bnr, ns_id, id+1600)
    elseif eobLine == 2 and winHeight > 1 then
      api.nvim_buf_del_extmark(bnr, ns_id, id)
      api.nvim_buf_del_extmark(bnr, ns_id, id+800)
    else
      api.nvim_buf_del_extmark(bnr, ns_id, id)
    end
  else
    api.nvim_buf_del_extmark(bnr, ns_id, id)
  end
end



local function writeVirtualFilenameByWinID(winID, boxed_style, winWidth_arg)
  local box_style = boxed_style or false
  local bnr = fn.winbufnr(winID)
  local ns_id = api.nvim_create_namespace('virtualTextFilename' .. bnr)
  local col_num = 0

  local status = ""
  if fn.getbufvar(bnr, '&mod') == 1 then
    status = ' [+] '
  end

  local filename = fn.bufname(bnr) .. status
  local line_num = fn.line('w0', winID)
  local leftPad = "│ "
  local rightPad = " │"
  local winWidth = fn.winwidth(winID) or winWidth_arg

  if line_num < 0 then
    line_num = 0
  end

  -- if filename == "" then
  --   filename = filename .. "[No Name]"
  -- end

  local horBar = ""

  local something;

  if winWidth < string.len(filename) + 4 then
    local stringOverflow = string.len(filename) - winWidth
    local ellipsis = "<"
    filename = ellipsis .. filename:sub(stringOverflow + 6)
  end

  for _ = 0, string.len(filename)+1, 1 do
    horBar = horBar .. "─"
  end

  local centerLine = leftPad .. filename .. rightPad
  local whiteSpace = ""
  local whiteSpaceCols = winWidth - string.len(centerLine) + 4

  if whiteSpaceCols > 0 then
    for i = 1, whiteSpaceCols, 1 do
      whiteSpace = whiteSpace .. " "
    end
  end

  local opts = {
    id = bnr,
    virt_text = {
      {leftPad, "VirtualFilenameBox"},
      {filename, "VirtualFilenameText"},
      {rightPad, "VirtualFilenameBox"},
    },
    virt_text_pos = 'right_align',
    strict = false,
  }

  local topOpts = {
    id = bnr + 800,
    virt_text = {
      {"╭" .. horBar .. "╮", "VirtualFilenameBox"}
    },
    virt_text_pos = 'right_align',
    strict = false,
  }

  local botOpts = {
    id = bnr + 1600,
    virt_text = {
      {"╰" .. horBar .. "╯", "VirtualFilenameBox"}
    },
    virt_text_pos = 'right_align',
    strict = false,
  }

  local specialOpts_case1 = {
    id = bnr,
    virt_text = {
      {leftPad, "VirtualFilenameBox"},
      {filename, "VirtualFilenameText"},
      {rightPad, "VirtualFilenameBox"},
    },
    virt_text_pos = 'right_align',
    virt_lines = {
      {{whiteSpace .. "╰" .. horBar .. "╯", "VirtualFilenameBox"}},
    },
    virt_lines_leftcol = true,
    strict = false,
  }

  local specialOpts_case2 = {
  id = bnr,
    virt_text = {
      {"╭" .. horBar .. "╮", "VirtualFilenameBox"},
    },
    virt_text_pos = 'right_align',
    virt_lines = {
      {
        {whiteSpace .. leftPad, "VirtualFilenameBox"},
        {filename, "VirtualFilenameText"},
        {rightPad, "VirtualFilenameBox"},
      },
      {{whiteSpace .. "╰" .. horBar .. "╯", "VirtualFilenameBox"}},
    },
    virt_lines_leftcol = true,
    strict = false,
  }

  local specialOpts_case3 = {
    id = bnr,
    virt_text = {
      {filename, "VirtualFilenameText"},
    },
    virt_text_pos = 'right_align',
    strict = false,
  }

  local non_boxed = {
    id = bnr,
    virt_text = {
      {" ", "VirtualFilenamePadNB"},
      {filename, "VirtualFilenameTextNB"},
      {" ", "VirtualFilenamePadNB"},
    },
    virt_text_pos = 'right_align',
    strict = false,
  }

  if decorated == true then
    non_boxed.virt_text = {
      {" ", "VirtualFilenamePadNB"},
      {filename, "VirtualFilenameTextNB"},
      {" ", "VirtualFilenamePadNB"},
    }
  else
    non_boxed.virt_text = {
      {"  ", "VirtualFilenamePadNB"},
      {filename, "VirtualFilenameTextNB"},
      {"  ", "VirtualFilenamePadNB"},
    }
  end

  local eobLine = fn.line('w$', winID)
  local winHeight = fn.winheight(winID)

  if filename ~= "" then
  if box_style == true then
    if winHeight > 1 then
      if eobLine >= 3 then
        api.nvim_buf_set_extmark(bnr, ns_id, line_num, col_num, opts)
        api.nvim_buf_set_extmark(bnr, ns_id, line_num-1, col_num, topOpts)
        api.nvim_buf_set_extmark(bnr, ns_id, line_num+1, col_num, botOpts)
      elseif eobLine == 2 then
        api.nvim_buf_set_extmark(bnr, ns_id, line_num-1, col_num, topOpts)
        api.nvim_buf_set_extmark(bnr, ns_id, line_num, col_num, specialOpts_case1)
      else
        api.nvim_buf_set_extmark(bnr, ns_id, line_num-1, col_num, specialOpts_case2)
      end
    else
      api.nvim_buf_set_extmark(bnr, ns_id, line_num-1, col_num, specialOpts_case3)
    end
  else
    api.nvim_buf_set_extmark(bnr, ns_id, line_num-1, col_num, non_boxed)
  end
end
end


api.nvim_create_autocmd({"WinResized"}, {
  pattern = "*",
  callback = function()
    local cur_winID = fn.win_getid()
    -- local cur_bnr = fn.winbufnr(cur_winID)
    cmd [[let g:winIDs = deepcopy(v:event.windows)]]
    for _, winID in ipairs(global.winIDs) do
      if winID ~= cur_winID then
        deleteVirtualFilenameByWinID(winID, box_styleStatus)
        writeVirtualFilenameByWinID(winID, box_styleStatus)
      end
      if fn.winwidth(winID) < 7 then
        deleteVirtualFilenameByWinID(winID, box_styleStatus)
      end
    end
  end
})


api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
  pattern = "*",
  callback = function()
    local winID = fn.win_getid()
    if api.nvim_win_get_config(winID).zindex then
      deleteVirtualFilenameByWinID(winID)
    else
      writeVirtualFilenameByWinID(winID, box_styleStatus)
    end

    -- for window in api.nvim_list_wins() do
    --   bfnr = fn.bufnr(window)
    --   if bfnr == fn.bufnr(winID) then
    --     writeVirtualFilenameByWinID(window, box_styleStatus)
    --   end

  end
})


api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
  pattern = "*",
  callback = function()
    local winID = fn.win_getid()
    deleteVirtualFilenameByWinID(winID, box_styleStatus)
  end
})
