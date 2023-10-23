return {
  -- Plugins will be added here

  -- colorscheme catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup { background = { dark = "mocha" } }
      vim.cmd.colorscheme "catppuccin"
    end
  },
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   name = "onedark",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme "onedark_dark"
  --   end
  -- },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim'
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- Comment higligted lines with gc
  { 'numToStr/Comment.nvim', opts = {} },

  -- Auto Pairs closes brackets
  {
    "windwp/nvim-autopairs"
  },

  -- Nvimtree (File Explorer)
  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- Which key plugin
  {
    "folke/which-key.nvim",
    lazy = true,
  },

  -- Toggle Term
  {
    'akinsho/toggleterm.nvim',
    config = true
  },

  -- Telescope (Fuzzy Finder)
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    }
  },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- Language Support
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
  },
  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    dependencies = 'nvim-lua/plenary.nvim'
  },

  -- copilot
  -- {
  --   'github/copilot.vim'
  -- },
  -- codeium
  {
    'Exafunction/codeium.vim'
  },

  -- Java setup
  {
    "mfussenegger/nvim-jdtls"
  }
}
