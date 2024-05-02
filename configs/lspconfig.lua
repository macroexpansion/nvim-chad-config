local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"

lspconfig.rust_analyzer.setup {
  on_attach = function(client, bufnr)
    local util = require "custom.configs.lsputil"
    vim.keymap.set("n", "<leader>lc", function()
      util.ra_flycheck()
    end, { desc = "rust_analyzer run flycheck" })

    on_attach(client, bufnr)
  end,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = false,
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
      diagnostics = {
        experimental = {
          enable = true,
        },
      },
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
  },
}

require "custom.configs.noice"
