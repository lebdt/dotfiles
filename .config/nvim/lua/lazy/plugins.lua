return {
  { 'christoomey/vim-tmux-navigator', lazy = false },

  -- { 'rcarriga/nvim-notify', lazy = false },

  {
  'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { {"nvim-lua/plenary.nvim"} },
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },

  "windwp/nvim-ts-autotag",

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
    lazy = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    lazy = false,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
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
}
