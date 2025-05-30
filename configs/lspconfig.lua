-- load defaults i.e lua_lsplsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- EXAMPLE
-- local servers = { "html", "cssls" }
-- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

lspconfig.rust_analyzer.setup {
  on_attach = function(client, bufnr)
    local util = require "configs.lsputil"
    vim.keymap.set("n", "<leader>lc", function()
      util.ra_flycheck()
    end, { desc = "rust_analyzer run flycheck" })

    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

    nvlsp.on_attach(client, bufnr)
  end,
  settings = {
    ["rust-analyzer"] = {
      files = {
        excludeDirs = { ".worktree" },
      },
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
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    python = {
      pythonPath = "./.venv/bin/python",
    },
  },
}

lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
}

lspconfig.yamlls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
  },
}
