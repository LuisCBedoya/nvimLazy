return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async',
  },
  event = 'VeryLazy',
  config = function()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    vim.keymap.set('n', 'zj', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zk', require('ufo').closeAllFolds)
    vim.keymap.set('n', 'zl', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.cmd([[ Lspsaga hover_doc ]])
      end
    end)

    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end,
    })
  end,
}
