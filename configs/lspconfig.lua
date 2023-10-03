local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.rs" },
      callback = function()
        vim.lsp.buf.format { timeout_ms = 500 }
      end,
    })

    on_attach(client, bufnr)
  end,
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
