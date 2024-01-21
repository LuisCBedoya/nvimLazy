local dap_status_ok, dap = pcall(require, 'dap')
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, 'dapui')
if not dap_ui_status_ok then
  return
end

return {
  require('nvim-dap-virtual-text').setup({}),

  vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' }),
  vim.fn.sign_define('DapStopped', { text = '▶', texthl = '', linehl = '', numhl = '' }),
  dapui.setup({
    icons = { expanded = '▾', collapsed = '▸' },
    layouts = {
      {
        elements = {
          'scopes',
          'breakpoints',
          'stacks',
          'watches',
        },
        size = 80,
        position = 'right',
      },
      {
        elements = {
          'repl',
          'console',
        },
        size = 10,
        position = 'bottom',
      },
    },
  }),

  -- Events Listeners
  dap.listeners.after.event_initialized['dapui_config'] == function()
      dapui.open({})
    end,
}
