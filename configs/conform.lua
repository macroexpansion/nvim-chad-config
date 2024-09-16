local conform = require "conform"

conform.setup {
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    -- python = { "isort", "black" },
    python = { "ruff_format" },
    -- Use a sub-list to run only the first available formatter
    javascript = { "prettier" },
    typescript = { "prettier" },
    lua = { "stylua" },
    rust = { "rustfmt" },
    go = { "goimports", "golines", "gofmt" },
  },
  format_on_save = {
    timeout_ms = 500,
    async = false,
    lsp_fallback = true,
  },
  formatters = {
    rustfmt = {
      command = "rustfmt",
      args = { "--edition", "2021" },
    },
    gofmt = {
      command = "gofmt",
    },
  },
}

vim.keymap.set({ "n", "v" }, "<leader>fmt", function()
  conform.format {
    timeout_ms = 500,
    async = false,
    lsp_fallback = false,
  }
end, { desc = "Conform format file or range in visual mode" })
