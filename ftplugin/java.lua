local status, jdtls = pcall(require, 'jdtls')
if not status then
  return
end

local home = os.getenv('HOME')
if vim.fn.has('mac') == 1 then
  WORKSPACE_PATH = home .. '/workspace/'
  CONFIG = 'mac'
elseif vim.fn.has('unix') == 1 then
  WORKSPACE_PATH = home .. '/workspace/'
  CONFIG = 'linux'
else
  print('Unsupported system')
end

local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)
if root_dir == '' then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local features = {
  -- change this to `true` to enable codelens
  codelens = false,

  -- change this to `true` if you have `nvim-dap`,
  -- `java-test` and `java-debug-adapter` installed
  debugger = true,
}

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = WORKSPACE_PATH .. project_name

-- JAVA_DAP_ACTIVE = false

local bundles = {
  vim.fn.glob(
    '$HOME/.local/share/nvim/servers/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
    1
  ),
}
vim.list_extend(
  bundles,
  vim.split(vim.fn.glob('$HOME/.local/share/nvim/servers/vscode-java-test/server/*.jar', 1), '\n')
)

local config = {
  -- cmd = { '/home/luc/.local/share/nvim/mason/bin/jdtls' },
  cmd = {

    -- 💀
    'java', -- or '/path/to/java11_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. home .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    '-jar',
    vim.fn.glob(home .. '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    '-configuration',
    home .. '/.local/share/nvim/mason/packages/jdtls/config_' .. CONFIG,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- 💀
    -- See `data directory configuration` section in the README
    '-data',
    workspace_dir,
  },

  -- capabilities = capabilities,
  root_dir = root_dir,
  capabilities = capabilities,

  settings = {
    java = {
      -- jdt = {
      --   ls = {
      --     vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx1G -Xms100m"
      --   }
      -- },
      eclipse = {
        downloadSources = true,
      },
      -- configuration = {
      -- 	updateBuildConfiguration = "interactive",
      -- 	runtimes = {
      -- 		{
      -- 			name = "JavaSE-11",
      -- 			path = "~/.sdkman/candidates/java/11.0.2-open",
      -- 		},
      -- 		{
      -- 			name = "JavaSE-18",
      -- 			path = "~/.sdkman/candidates/java/18.0.1.1-open",
      -- 		},
      -- 	},
      -- },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = 'all', -- literals, all, none
        },
      },
      format = {
        enabled = false,
        -- settings = {
        --   profile = "asdf"
        -- }
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        'org.hamcrest.MatcherAssert.assertThat',
        'org.hamcrest.Matchers.*',
        'org.hamcrest.CoreMatchers.*',
        'org.junit.jupiter.api.Assertions.*',
        'java.util.Objects.requireNonNull',
        'java.util.Objects.requireNonNullElse',
        'org.mockito.Mockito.*',
      },
    },
    contentProvider = { preferred = 'fernflower' },
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
      },
      useBlocks = true,
    },
  },

  flags = {
    allow_incremental_sync = true,
  },

  init_options = {
    -- bundles = {},
    bundles = bundles,
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  --   root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  --   on_attach = function(client, bufnr)
  --     require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  --     require('jdtls.dap').setup_dap_main_class_configs()
  --     -- require('jdtls').add_commands()
  --   end,
  --   initializationOptions = {
  --     bundles = {
  --       bundles = bundles,
  --     },
  --   },
}

config['on_attach'] = function(client, bufnr)
  local _, _ = pcall(vim.lsp.codelens.refresh)
  require('jdtls.dap').setup_dap_main_class_configs()
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  require('lsp').on_attach(client, bufnr)
end

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = { '*.java' },
  callback = function()
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
})

vim.cmd(
  [[command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)]]
)
vim.cmd([[command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()]])

jdtls.start_or_attach(config)
