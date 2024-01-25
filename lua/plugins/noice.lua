local cmp = require('cmp')
require('noice').setup({
  views = {
    cmdline_popup = {
      position = {
        row = 0,
        col = '50%',
      },
      size = {
        width = 60,
        height = 'auto',
      },
    },
  },
  messages = {
    enabled = true,
  },
  notify = {
    enabled = false,
  },
  lsp = {
    progress = {
      enabled = false,
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
  },
})
-- local mapping = {
--   ['<CR>'] = cmp.mapping.confirm({ select = true }),
--   ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
--   ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
-- }

-- -- Use buffer source for `/`.
-- cmp.setup.cmdline('/', {
--   mapping = mapping,
-- })

-- -- Use cmdline & path source for ':'.
-- cmp.setup.cmdline(':', {
--   mapping = mapping,
-- })
