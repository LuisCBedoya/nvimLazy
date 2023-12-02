local M = {
  'lewis6991/hover.nvim',
  opts = {
    init = function()
      require('hover.providers.lsp')
    end,
    preview_opts = {
      border = 'rounded',
    },
    title = true,
  },
  config = function(_, opts)
    require('hover').setup(opts)
    vim.keymap.set('n', '<leader>k', require('hover').hover, { desc = 'hover.nvim' })
    vim.keymap.set('n', '<leader>K', require('hover').hover_select, { desc = 'hover.nvim (select)' })
  end,
  event = 'VeryLazy',
}

return M
