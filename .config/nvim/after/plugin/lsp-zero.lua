local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.set_server_config({
  on_init = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

require('lspconfig.ui.windows').default_options.border = 'rounded'

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = {
    -- `Enter` key to confirm completion
    ['<Tab>'] = cmp.mapping.confirm({select = false}),
  },

  preselect = 'item',
  
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  formatting = {
      format = function(_, vim_item)
          vim_item.kind = vim_item.kind .. " "
          return vim_item
      end,
  },

})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
        border = 'rounded',
    }
})

-- vim.keymap_set("<leader>ca", vim.buf)

-- LSP Custom Setup

-- local lsp_custom_config = require('lsp-zero')
--
-- lsp_custom_config.configure('lua_ls', {
--   cmd = { 'lua-language-server' },
--   settings = {
--     Lua = {
--       runtime = {
--         version = 'LuaJIT',
--         path = vim.split(package.path, ';'),
--       },
--       diagnostics = {
--         globals = { 'vim' },
--       },
--       workspace = {
--         library = {
--           [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--           [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--         },
--       },
--     },
--   },
-- })
