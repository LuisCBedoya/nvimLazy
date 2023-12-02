local M = {
  'smjonas/inc-rename.nvim',
  opts = {},
  config = function(_, opts)
    local increname = require('inc_rename')

    increname.setup(opts)

    -- rename symbol under cursor
    vim.keymap.set('n', '<leader>n', function()
      return ':IncRename ' .. vim.fn.expand('<cword>')
    end, { expr = true })
  end,
  event = 'VeryLazy',
}

return M
