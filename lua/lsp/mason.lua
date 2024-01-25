-- **** LSP
local servers = {
  'pyright', --python
  'tsserver', -- js
  'emmet_ls', -- html
  'lua_ls', -- lua
  'cssls', --css
  'jdtls', --java
  'marksman', -- markdown
  'intelephense', --php
}
-- **** DEBUGGERS
local debuggers = {
  'debugpy', -- python
  'java-debug-adapter', -- java
  'java-test', -- java
}
-- **** FORMATTERS
local null_ls = {
  'black', -- python
  'stylua', -- lua
  'prettier', -- html, css , js, etc
  'google_java_format', -- java
  'jq', -- json
  'phpcsfixer', -- php
}

local settings = {
  ui = {
    border = 'rounded',
    icons = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },
}

require('mason').setup(settings)
require('mason-lspconfig').setup({
  ensure_installed = servers,
  automatic_installation = true,
})

require('mason-nvim-dap').setup({
  ensure_installed = debuggers,
  automatic_installation = true,
})

require('mason-null-ls').setup({
  ensure_installed = null_ls,
  automatic_installation = true,
})

local lspconfig = require('lspconfig')
local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require('lsp.handlers').on_attach,
    capabilities = require('lsp.handlers').capabilities,
  }

  if server == 'jdtls' then
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
