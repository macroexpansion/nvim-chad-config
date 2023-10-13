local conform = require "conform"

conform.setup {
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { "prettier" },
    typescript = { "prettier" },
    lua = { "stylua" },
    rust = { "rustfmt" },
    go = { "goimports", "golines", "gofumpt" },
  },
  format_on_save = {
    timeout_ms = 500,
    async = false,
    lsp_fallback = true,
  },
  formatters = {
    rustfmt = {
      command = "rustfmt",
    },
  },
}

-- Auto format command
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     conform.format {
--       bufnr = args.buf,
--       timeout_ms = 500,
--       async = false,
--       lsp_fallback = false,
--     }
--   end,
-- })

vim.keymap.set({ "n", "v" }, "<leader>fmt", function()
  conform.format {
    timeout_ms = 500,
    async = false,
    lsp_fallback = false,
  }
end, { desc = "Conform format file or range in visual mode" })
