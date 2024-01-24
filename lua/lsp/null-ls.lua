local null_ls = require('null-ls')
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
  debug = false,
  sources = {
    formatting.stylua.with({
      extra_args = { '--config-path', vim.fn.expand('$HOME/.config/nvim/lua/lsp/formatters/.stylua.toml') },
    }),
    formatting.prettier.with({ -- html,css,js, etc
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('$HOME/.config/nvim/lua/lsp/formatters/.prettierrc.json'),
      },
    }),
    formatting.black.with({ -- html,css,js, etc
      filetypes = {
        'python',
      },
    }),
    formatting.google_java_format.with({ -- html,css,js, etc
      filetypes = {
        'java',
      },
    }),

    -- linters / diagnostics binaries
    -- diagnostics.tidy, -- XML
  },

  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.cmd([[
                augroup document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
              ]])
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(client)
              return client.name == 'null-ls'
            end,
          })
        end,
      })
    end
  end,
})
