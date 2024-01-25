local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
plugins = {
  { 'nvim-lua/plenary.nvim' },
  { 'kyazdani42/nvim-web-devicons' },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  -- **** THEMES *****************
  {
    'EdenEast/nightfox.nvim',
    name = 'nightfox',
    lazy = false,
    priority = 1000,
    config = function()
      require('plugins.nightfox')
    end,
  },
  -- {
  --   'marko-cerovac/material.nvim',
  --   name = 'material',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('plugins.material')
  --   end,
  -- },
  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   name = 'gruvbox',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('plugins.gruvbox')
  --   end,
  -- },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('plugins.catpuccin')
  --   end,
  -- },
  -- {
  --   'navarasu/onedark.nvim',
  --   name = 'onedark',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('plugins.onedark')
  --   end,
  -- },
  -- **** alpha *****************
  {
    'goolord/alpha-nvim',
    config = function()
      require('plugins.alpha')
    end,
  },
  -- **** INDENT *****************
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('plugins.indentline')
    end,
  },
  -- **** ZENMODE *****************
  {
    'folke/zen-mode.nvim',
    config = function()
      require('plugins.zenmode')
    end,
    keys = {
      { '<leader>azm', desc = 'Active Zen Mode' },
      { '<leader>z', ':ZenMode<cr>', desc = 'Zen Mode' },
    },
  },
  -- **** DATABASE *****************
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      'tpope/vim-dadbod',
      'kristijanhusak/vim-dadbod-completion',
      'tpope/vim-dotenv',
    },
    keys = {
      { '<leader>db', ':tab DBUI<cr>', desc = 'Open Database client' },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_win_position = 'left'
      vim.g.db_ui_winwidth = 80

      vim.g.db_ui_table_helpers = {
        mysql = {
          Count = 'select count(1) from {optional_schema}{table}',
          Explain = 'EXPLAIN {last_query}',
        },
        sqlite = {
          Describe = 'PRAGMA table_info({table})',
        },
      }
    end,
  },
  -- **** twilight *****************
  {
    'folke/twilight.nvim',
    cmd = { 'Twilight' },
    config = true,
  },
  -- **** COLORIZER *****************
  {
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy',
    config = function()
      require('colorizer').setup()
    end,
  },
  -- **** CMDLINE *****************
  {
    'gelguy/wilder.nvim"',
    enabled = false,
  },
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    event = 'BufWinEnter',
    config = function()
      require('plugins.noice')
    end,
  },
  -- **** INPATIENT *****************
  {
    'lewis6991/impatient.nvim',
    event = 'BufWinEnter',
    config = function()
      require('impatient').enable_profile()
    end,
  },
  -- **** MINIANIMATE *****************
  -- {
  --   'echasnovski/mini.animate',
  --   config = function()
  --     require('mini.animate').setup()
  --   end,
  -- },
  -- **** LUALINE *****************
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
      require('plugins.lualine')
    end,
  },
  -- **** NEOGEN *****************
  {
    'danymat/neogen',
    cmd = { 'Neogen' },
    config = true,
    keys = {
      { '<leader>an', desc = 'Active neogen - (Crea anotaciones con un keymaps) ' },
      { '<leader>n', ':Neogen<cr>', desc = 'Add comment to the near possible object' },
    },
    opts = { snippet_engine = 'luasnip' },
  },
  -- **** NUMB *****************
  {
    'nacro90/numb.nvim',
    config = true,
  },
  -- **** HLARGS *****************
  -- {
  --   'm-demare/hlargs.nvim',
  --   event = 'VeryLazy',
  --   config = true,
  -- },
  -- **** BARBECUE *****************
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    event = 'VeryLazy',
    dependencies = {
      'SmiteshP/nvim-navic',
    },
    config = function()
      require('plugins.barbecue')
    end,
  },
  -- **** CODERRUNER *****************
  {
    'CRAG666/code_runner.nvim',
    config = function()
      require('plugins.coderrunner')
    end,
    keys = {
      { '<leader>acr', desc = 'Active coderrunner' },
      { '<leader>rc', '<cmd>RunCode<CR>', desc = 'Run Code' },
      { '<leader>rf', '<cmd>RunCode<CR>', desc = 'Run file' },
      { '<leader>rp', '<cmd>RunCode<CR>', desc = 'Run project' },
      {
        '<leader>rs',
        '<cmd>autocmd bufwritepost [^_]*.sass,[^_]*.scss  silent exec "!sass %:p %:r.css"<CR>',
        desc = 'Auto Compile Sass',
      },
    },
  },
  -- **** BUFFERLINE *****************
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    keys = {
      { '<Tab>', '<cmd>BufferLineCycleNext<CR>' },
      -- { '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>' },
      { '<leader>bp', '<cmd>BufferLinePick<CR>' },
      { '<leader>bpc', '<cmd>BufferLinePickClose<CR>' },
      { '<C-m><C-n>', '<cmd> BufferLineMoveNext<CR>' },
      { '<C-m><C-p>', '<cmd> BufferLineMovePrev<CR>' },
    },
    config = function()
      require('bufferline').setup()
    end,
  },
  -- **** SCOPE *****************
  -- {
  --   'tiagovla/scope.nvim',
  --   config = function()
  --     -- init.lua
  --     require('scope').setup()
  --   end,
  -- },
  -- **** BUFDELETE *****************
  -- {
  --   'famiu/bufdelete.nvim',
  --   event = 'VeryLazy',
  --   keys = {
  --     { '<leader>x', '<cmd>Bdelete!<CR>' },
  --   },
  -- },
  --
  --{
  --	"goolord/alpha-nvim",
  --	config = function()
  --		require("plugins.alpha")
  --	end,
  --},
  --

  -- **** TREESITTER *****************
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function()
      require('plugins.treesitter')
    end,
  },
  -- **** REINBOW *****************
  { 'hiphish/rainbow-delimiters.nvim' },
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
  -- **** COMMENT *****************
  {
    'terrortylor/nvim-comment',
    lazy = false,
    config = function()
      require('plugins.comment')
    end,
  },
  -- **** NOTIFY *****************
  {
    'rcarriga/nvim-notify',
    config = function()
      require('plugins.notify')
    end,
  },
  -- **** TELESCOPE *****************
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>' },
      { '<leader>fr', '<cmd>Telescope oldfiles<cr>' },
      { '<leader>fp', '<cmd>Telescope projects<cr>' },
      { '<leader>fk', '<cmd>Telescope keymaps<cr>' },
    },
    config = function()
      require('plugins.telescope')
    end,
  },
  -- **** AUTOPAIRS *****************
  {
    'windwp/nvim-autopairs',
    lazy = false,
    config = function()
      require('plugins.autopairs')
    end,
  },
  -- **** PROJECY ******************
  {
    'ahmedkhalf/project.nvim',
    lazy = false,
    config = function()
      require('plugins.project')
    end,
  },
  --{
  --	"uga-rosa/ccc.nvim",
  --	lazy = false,
  --	config = function()
  --		require("ccc").setup({
  --			highlighter = {
  --				auto_enable = true,
  --				lsp = true,
  --			},
  --		})
  --	end,
  --},
  -- **** TOGGLETERM *****************
  {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    keys = {
      { mode = 't', '<C-q>', [[<C-\><C-n>]] },
      { mode = { 'n', 't' }, '<A-1>', '<cmd>ToggleTerm 1<cr>' },
      { mode = { 'n', 't' }, '<A-2>', '<cmd>ToggleTerm 2<cr>' },
      { mode = { 'n', 't' }, '<C-l><C-a>', '<cmd>lua _lazygit_toggle()<cr>' },
      --[[ { mode = { "n", "t" }, "<C-r><C-a>", "<cmd>lua _ranger_toggle()<cr>" }, ]]
      { mode = { 'n', 't' }, '<C-l><C-a>', '<cmd>lua _lazygit_toggle()<cr>' },
    },
    config = function()
      require('plugins.toggleterm')
    end,
  },
  -- **** PANTRAN *****************
  {
    'potamides/pantran.nvim',
    -- event = 'VeryLazy',
    keys = {
      { '<leader>apn', desc = 'Active pantran (Motores de traducción automática)' },
      { '<C-t>', '<cmd>Pantran<CR>' },
    },
    config = function()
      require('plugins.pantran')
    end,
  },
  -- **** REST *****************
  {
    -- 'rest-nvim/rest.nvim',
    'NTBBloodbath/rest.nvim',
    event = 'VeryLazy',
    ft = 'http',
    keys = {
      { '<leader>ar', desc = 'Active Rest' },
      { '<leader>r', '<Plug>RestNvim' },
    },
    config = function()
      require('plugins.rest')
    end,
  },
  -- **** NVIMTREE *****************
  {
    'kyazdani42/nvim-tree.lua',
    keys = {
      { '<leader>e', '<cmd> NvimTreeToggle<CR>' },
    },
    config = function()
      require('plugins.nvimtree')
    end,
  },
  -- **** GLOW (markdown) *****************
  {
    'ellisonleao/glow.nvim',
    cmd = 'Glow',
    config = function()
      require('glow').setup({
        style = 'dark',
        width = 800,
      })
    end,
  },

  -- **** CMP *****************
  -- cmp plugins
  { 'hrsh7th/nvim-cmp' }, -- The completion plugin
  { 'hrsh7th/cmp-buffer' }, -- buffer completions
  { 'hrsh7th/cmp-path' }, -- path completions
  { 'hrsh7th/cmp-cmdline' }, -- cmdline completions
  { 'saadparwaiz1/cmp_luasnip' }, -- snippet completions
  { 'hrsh7th/cmp-nvim-lsp' }, -- enable lsp autocomplete with cmp
  { 'mfussenegger/nvim-jdtls' },

  -- **** LSP *****************
  -- LSP
  { 'neovim/nvim-lspconfig' },
  { 'nvimtools/none-ls.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'williamboman/mason.nvim' },
  { 'jayp0521/mason-nvim-dap.nvim' },
  { 'jayp0521/mason-null-ls.nvim' },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = true,
    keys = {
      { '<leader>alsl', desc = 'Active lsp_lines' },
    },
  },
  {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    keys = {
      { '<leader>dt', '<cmd>DapToggleBreakpoint<cr>' },
      { '<leader>dc', '<cmd>DapContinue<cr>' },
      { '<leader>di', '<cmd>DapStepInto<cr>' },
      { '<leader>do', '<cmd>DapStepOver<cr>' },
    },
    config = function()
      require('plugins.dap')
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    keys = {
      { '<leader>du', "<cmd>lua require'dapui'.toggle({reset=true})<cr>" },
    },
    config = function()
      require('plugins.dapui')
    end,
  },
  {
    'mfussenegger/nvim-dap-python',
    ft = 'py',
    event = 'VeryLazy',
    config = function()
      require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
    end,
  },
  -- **** LUASNIP *****************
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
  },
  { 'rafamadriz/friendly-snippets' },
  -- **** GIT *****************
  -- Git
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    keys = {

      { '<leader>gs', '<cmd> Gitsigns show<CR>' },
      { '<leader>gt', '<cmd> Gitsigns toggle_deleted<CR>' },
      { '<leader>gd', '<cmd> Gitsigns diffthis<CR>' },
    },
    config = function()
      require('plugins.git')
    end,
  },

  {
    'tpope/vim-dadbod',
    event = 'VeryLazy',
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    event = 'VeryLazy',
  },
}
require('lazy').setup(plugins, opts)
