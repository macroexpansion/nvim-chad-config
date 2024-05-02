local M = {}

M.get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients

M.ra_flycheck = function()
  local client_found = false

  local filter = {
    name = "rust_analyzer",
    bufnr = 0,
  }
  local clients = M.get_clients(filter)
  for _, client in ipairs(clients) do
    local params = vim.lsp.util.make_text_document_params()
    client.notify("rust-analyzer/runFlycheck", params)
    client_found = true
  end

  if not client_found then
    vim.notify("No rust-analyzer client found", vim.log.levels.ERROR)
  end
end

return M
