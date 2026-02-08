-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

vim.lsp.config("rust_analyzer", {
  on_attach = function(client, bufnr)
    local util = require "configs.lsputil"
    vim.keymap.set("n", "<leader>lch", function()
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
})
vim.lsp.enable "rust_analyzer"

vim.lsp.config("ty", {
  settings = {
    ty = {
      disableLanguageServices = false,
      inlayHints = {
        variableTypes = true,
      },
      diagnosticMode = "workspace",
      completions = {
        autoImport = true,
      },
    },
  },
})
vim.lsp.enable "ty"

vim.lsp.config("gopls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
})
vim.lsp.enable "gopls"

vim.lsp.config("yamlls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
  },
})
vim.lsp.enable "yamlls"
