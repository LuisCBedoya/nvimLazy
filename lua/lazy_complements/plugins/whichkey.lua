return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require('which-key')
    local toggle_float = function()
      local float = Terminal:new({ direction = 'float' })
      return float:toggle()
    end
    local toggle_lazygit = function()
      local lazygit = Terminal:new({ cmd = 'lazygit', direction = 'float' })
      return lazygit:toggle()
    end
    local mappings = {
      q = { ':q<cr>', 'Quit' },
      Q = { ':wq<cr>', 'Save & Quit' },
      w = { ':w<cr>', 'Save' },
      x = { ':bdelete<cr>', 'Close' },
      f = { ':Telescope find_files<cr>', 'Telescope Find Files' },
      r = { ':Telescope live_grep<cr>', 'Telescope Live Grep' },
      t = { ':ToggleTerm<cr>', 'Split Below' },
      -- l = {
      --   name = 'LSP',
      --   i = { ':LspInfo<cr>', 'Connected Language Servers' },
      --   k = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Signature Help' },
      --   K = { '<cmd>Lspsaga hover_doc<cr>', 'Hover Commands' },
      --   w = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', 'Add Workspace Folder' },
      --   W = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', 'Remove Workspace Folder' },
      --   l = {
      --     '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
      --     'List Workspace Folders',
      --   },
      --   t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Type Definition' },
      --   d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go To Definition' },
      --   D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go To Declaration' },
      --   r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'References' },
      --   R = { '<cmd>Lspsaga rename<cr>', 'Rename' },
      --   a = { '<cmd>Lspsaga code_action<cr>', 'Code Action' },
      --   e = { '<cmd>Lspsaga show_line_diagnostics<cr>', 'Show Line Diagnostics' },
      --   n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Go To Next Diagnostic' },
      --   N = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Go To Previous Diagnostic' },
      -- },
      -- z = {
      --     name = "Focus",
      --     z = { ":ZenMode<cr>", "Toggle Zen Mode" },
      --     t = { ":Twilight<cr>", "Toggle Twilight" },
      -- },
      -- n = {
      --   name = 'null-ls',
      --   l = { ':NullLsLog<cr>', 'Nulls Log' },
      --   i = { ':NullLsInfo<cr>', 'Nulls Info' },
      -- },
    }

    local setup = {
      icons = {
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        separator = '➜', -- symbol used between a key and it's label
        group = '+', -- symbol prepended to a group
      },
      ignore_missing = true,
    }

    local opts = {
      prefix = '<leader>',
    }

    wk.setup(setup)
    wk.register(mappings, opts)
    -------------------------------------------------
  end,
}