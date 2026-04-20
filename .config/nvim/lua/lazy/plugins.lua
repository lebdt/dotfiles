return {
  { 'christoomey/vim-tmux-navigator', lazy = false },

  -- { 'rcarriga/nvim-notify', lazy = false },

  {
  'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { {"nvim-lua/plenary.nvim"} },
    lazy = false,
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
  },
  --
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   lazy = false,
  -- },
  --
  -- {
  --   "windwp/nvim-ts-autotag",
  --   lazy = true,
  -- },
  --

  {
    "ibhagwan/fzf-lua",
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      {"neovim/nvim-lspconfig"},
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},

      -- Autocompletion
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"L3MON4D3/LuaSnip"},
    },
    lazy = false,
  },

  {
    "mbbill/undotree",
    lazy = false,
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    lazy = false,
  },

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
  },

  -- {
  --   "numToStr/Comment.nvim",
  --   config = true,
  --   opts = {},
  --   lazy = false,
  -- },

  {
    "m4xshen/autoclose.nvim",
    lazy = false,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    lazy = false,
  },

  -- {
  --   "sheerun/vim-polyglot",
  --   lazy=false,
  -- },

  {
    "itchyny/vim-cursorword",
    lazy=false,
  },

}
