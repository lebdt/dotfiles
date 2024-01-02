-- currentHour = tonumber(os.date('%H'))

-- randomNumber = math.random(10)
randomNumber = 6

if randomNumber < 5 then
  myColors = {
    bg            = "111111",
    tab_title_bg  = '111111',
    border        = "111111",
    black         = '020202',
    right_status  = '282B33',
  }
else
  myColors = {
    bg            = "12171f",
    tab_title_bg  = "12171f",
    border        = "12171f",
    black         = "081017",
    right_status  = '081017',
  }
end

local wezterm = require 'wezterm'
local config = {}

-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- config.freetype_interpreter_version = 40
config.front_end = "WebGpu"
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.cursor_blink_rate = 0
config.audible_bell = 'Disabled'
config.bold_brightens_ansi_colors = "BrightAndBold" or true
config.show_tabs_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.font = wezterm.font('RobotoMono Nerd Font Mono')
config.font_size = 16
config.cell_width = 0.9
config.line_height = 1.02
config.use_fancy_tab_bar = false
config.tab_max_width = 180
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.check_for_updates = false
config.window_close_confirmation = 'AlwaysPrompt'
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.window_background_opacity = 0.99
-- config.macos_window_background_blur = 10
config.text_background_opacity = 1
config.initial_rows = 30
config.initial_cols = 92

local function basename(s)
  return s:gsub('(.*[/\\])(.*)', '%2')
end



config.colors = {
  cursor_fg = "#010101",
  cursor_bg = "#dedede",
  cursor_border = myColors.bg,
  background = myColors.bg,

  ansi = {
    myColors.black,
    'e33232',
    'b3d64e',
    'ff926e',
    '8085ef',
    '70a553',
    '8ea4f3',
    'silver',
  },

  brights = {
    'ddd2dd',
    'red',
    '9ac46a',
    'ff926e',
    '4084cc',
    'a8d787',
    '50c0c0', -- Cyan
    'ffffff',
  },

  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = myColors.bg,

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = myColors.bg,
      -- fg_color = 'AEAEAE',
      fg_color = 'cdcdcd',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Normal',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = myColors.bg,
      fg_color = "424242"
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}

config.window_padding = {
  left    = '1.1cell',
  right   = '1.1cell',
  top     = '0.8cell',
  bottom  = '0.2cell',
}

local borderWidth = 0

config.window_frame = {
  -- border_left_width     = borderWidth,
  -- border_right_width    = borderWidth,
  -- border_bottom_height  = borderWidth,
  -- border_top_height     = borderWidth,
  -- border_left_color     = myColors.border,
  -- border_right_color    = myColors.border,
  -- border_bottom_color   = myColors.border,
  -- border_top_color      = myColors.border,
  font_size             = 13.5,
  active_titlebar_bg    = myColors.tab_title_bg,
  inactive_titlebar_bg  = myColors.bg,
  font                  = wezterm.font {
    family = 'SF Pro Display',
    weight = 'Bold'
  },
}

-- config.debug_key_events = true

tmux_keys = {

  {
    key     = 'phys:i',
    mods    = 'CTRL|SHIFT',
    action  = wezterm.action.Multiple { 
      wezterm.action.SendKey { key='x', mods='CTRL|SHIFT' },
    }
  },

  {
    key     = '9',
    mods    = 'CMD',
    action  = wezterm.action.Multiple { 
      wezterm.action.SendKey { key =' ', mods='CTRL' },
      wezterm.action.SendKey { key ='9' }
    }
  },

  {
    key     = '8',
    mods    = 'CMD',
    action  = wezterm.action.Multiple { 
      wezterm.action.SendKey { key =' ', mods='CTRL' },
      wezterm.action.SendKey { key ='8' }
    }
  },

  {
    key     = '7',
    mods    = 'CMD',
    action  = wezterm.action.Multiple { 
      wezterm.action.SendKey { key =' ', mods='CTRL' },
      wezterm.action.SendKey { key ='7' }
    }
  },

  {
    key     = '6',
    mods    = 'CMD',
    action  = wezterm.action.Multiple { 
      wezterm.action.SendKey { key =' ', mods='CTRL' },
      wezterm.action.SendKey { key ='6' }
    }
  },

  {
    key     = '5',
    mods    = 'CMD',
    action  = wezterm.action.Multiple { 
      wezterm.action.SendKey { key =' ', mods='CTRL' },
      wezterm.action.SendKey { key ='5' }
    }
  },

  {
    key     = '4',
    mods    = 'CMD',
    action  = wezterm.action.Multiple { 
      wezterm.action.SendKey { key =' ', mods='CTRL' },
      wezterm.action.SendKey { key ='4' }
    }
  },

  {
    key     = '3',
    mods    = 'CMD',
    action  = wezterm.action.Multiple { 
      wezterm.action.SendKey { key =' ', mods='CTRL' },
      wezterm.action.SendKey { key ='3' }
    }
  },

  {
    key     = '2',
    mods    = 'CMD',
    action  = wezterm.action.Multiple { 
      wezterm.action.SendKey { key =' ', mods='CTRL' },
      wezterm.action.SendKey { key ='2' }
    }
  },

  {
    key     = '1',
    mods    = 'CMD',
    action  = wezterm.action.Multiple { 
      wezterm.action.SendKey { key =' ', mods='CTRL' },
      wezterm.action.SendKey { key ='1' }
    }
  },

  {
    key     = 't',
    mods    = 'CMD',
    action  = wezterm.action.Multiple { 
      wezterm.action.SendKey { key =' ', mods='CTRL' },
      wezterm.action.SendKey { key ='c' }
    }
  },

  {
    key     = '`',
    mods    = 'CTRL',
    action  = wezterm.action.Multiple { 
      wezterm.action.SendKey { key =' ', mods='CTRL' },
      wezterm.action.SendKey { key ='`', mods='CTRL' }
    }
  },

  {
    key     = 'Tab',
    mods    = 'CTRL',
    action  = wezterm.action.Multiple { 
      wezterm.action.SendKey { key =' ', mods='CTRL' },
      wezterm.action.SendKey { key ='Tab', mods='CTRL' }
    }
  },

}

config.keys = {

  {
    key     = 't',
    mods    = 'CMD|SHIFT',
    action  = wezterm.action.SpawnTab 'CurrentPaneDomain' ,
  },

  {
    key     = 's',
    mods    = 'CMD',
    action  = wezterm.action.SendKey { key = 's', mods = 'META' },
  },

  {
    key     = 'R',
    mods    = 'CMD',
    action  = wezterm.action.SendKey { key = 'R', mods = 'META' },
  },

  {
    key     = 'r',
    mods    = 'CMD',
    action  = wezterm.action.SendKey { key = 'r', mods = 'META' },
  },

  {
    key     = 'b',
    mods    = 'CMD',
    action  = wezterm.action.SendKey { key = 'b', mods = 'META' },
  },

  {
    key     = 'B',
    mods    = 'CMD',
    action  = wezterm.action.SendKey { key = 'B', mods = 'META' },
  },

  {
    key     = 'K',
    mods    = 'CMD',
    action  = wezterm.action.SendKey { key = 'K', mods = 'META' },
  },

  {
    key     = 'J',
    mods    = 'CMD',
    action  = wezterm.action.SendKey { key = 'J', mods = 'META' },
  },

  {
    key     = 'd',
    mods    = 'CMD',
    action  = wezterm.action.SendKey { key = 'd', mods = 'META' },
  },

  {
    key     = 'a',
    mods    = 'CMD',
    action  = wezterm.action.SendKey { key = 'a', mods = 'META' },
  },

  {
    key     = 'F',
    mods    = 'CMD',
    action  = wezterm.action.SendKey { key = 'F', mods = 'META' },
  },

  {
    key     = 'f',
    mods    = 'CMD',
    action  = wezterm.action.SendKey { key = 'f', mods = 'META' },
  },

  {
    key     = 'C',
    mods    = 'CMD',
    action  = wezterm.action.SendKey { key = 'C', mods = 'META' },
  },

}


for i=1, #tmux_keys, 1 do
  table.insert(config.keys, tmux_keys[i])
end

-- if os.getenv('TMUX') then
-- end

return config
