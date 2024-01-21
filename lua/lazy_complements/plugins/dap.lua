return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'rcarriga/cmp-dap',
    'theHamsta/nvim-dap-virtual-text',
    -- 'leoluz/nvim-dap-go',
    'mxsdev/nvim-dap-vscode-js',
    -- 'anuvyklack/hydra.nvim',
    -- 'nvim-telescope/telescope-dap.nvim',
  },
  -- keys = { { '<leader>l', desc = 'Open Debug menu' } },
  config = function()
    require('dapui')
    -- for _, ft_path in ipairs(vim.api.nvim_get_runtime_file('lua/lazy_complements/ftplugin/Debuggers/*.lua', true)) do
    --   loadfile(ft_path)()
    -- end

    -- local dap = require('dap')

    local ok_cmp, cmp = pcall(require, 'cmp')
    if ok_cmp then
      cmp.setup.filetype({ 'dap-repl', 'dapui_watches' }, {
        sources = cmp.config.sources({
          { name = 'dap' },
        }, {
          { name = 'buffer' },
        }),
      })
    end
  end,
}
