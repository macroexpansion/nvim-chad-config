-- require "nvchad.mappings"

local map = vim.keymap.set

map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Dont copy replaced text" })

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "dx", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

map("n", ";", ":", { desc = "CMD enter command mode" })

-- telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>fs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>ft", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "Find all" })
map("n", "<leader>fr", "<cmd>Telescope resume<CR>", { desc = "Find all" })

-- trouble
map("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble in workspace" })
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Trouble in current buffer" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble location list" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble quickfix" })
map("n", "<leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "Trouble references" })

-- lspconfig
map("n", "<leader>lD", function()
  vim.lsp.buf.declaration()
end, { desc = "LSP declaration" })
map("n", "<leader>ld", function()
  vim.lsp.buf.definition()
end, { desc = "LSP definition" })
map("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { desc = "LSP Saga hover_doc" })
map("n", "<leader>lf", "<cmd>Lspsaga finder<CR>", { desc = "LSP Saga finder" })
map("n", "<leader>lci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "LSP Saga incoming calls" })
map("n", "<leader>lca", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "LSP Saga outoing calls" })
map("n", "<leader>lgd", "<cmd>Lspsaga goto_definition<CR>", { desc = "LSP Saga goto_definition" })
map("n", "<leader>lK", function()
  vim.lsp.buf.hover()
end, { desc = "LSP hover" })
map("n", "<leader>li", function()
  vim.lsp.buf.implementation()
end, { desc = "LSP implementation" })
map("n", "<leader>ls", function()
  vim.lsp.buf.signature_help()
end, { desc = "LSP signature help" })
map("n", "<leader>lt", function()
  vim.lsp.buf.type_definition()
end, { desc = "LSP definition type" })
map("n", "<leader>lR", "<cmd>Lspsaga rename<CR>", { desc = "LSP Saga rename" })
map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "LSP Saga code_action" })
map("n", "<leader>lr", function()
  vim.lsp.buf.references()
end, { desc = "LSP references" })
map("n", "<leader>lx", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Floating diagnostic" })
-- map("n", "<leader>lk", function()
--   vim.diagnostic.goto_prev { float = { border = "rounded" } }
-- end, { desc = "Goto prev" })
-- map("n", "<leader>lj", function()
--   vim.diagnostic.goto_next { float = { border = "rounded" } }
-- end, { desc = "Goto next" })
map("n", "<leader>lq", function()
  vim.diagnostic.setloclist()
end, { desc = "Diagnostic setloclist" })
map("n", "<leader>lgf", function()
  vim.lsp.buf.format { timeout_ms = 500 }
end, { desc = "LSP formatting" })
map("n", "<leader>lp", "<cmd>Lspsaga peek_definition<CR>", { desc = "LSP Saga peek_definition" })
-- map("n", "<leader>wa", function()
--   vim.lsp.buf.add_workspace_folder()
-- end, { desc = "Add workspace folder" })
-- map("n", "<leader>wr", function()
--   vim.lsp.buf.remove_workspace_folder()
-- end, { desc = "Remove workspace folder" })
-- map("n", "<leader>wr", function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, { desc = "List workspace folders" })

-- gitsigns
map("n", "<leader>hj", function()
  if vim.wo.diff then
    return "<leader>hj"
  end
  vim.schedule(function()
    require("gitsigns").next_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to next hunk", expr = true })
map("n", "<leader>hk", function()
  if vim.wo.diff then
    return "<leader>hk"
  end
  vim.schedule(function()
    require("gitsigns").prev_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to prev hunk", expr = true })
map("n", "<leader>hp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
map("n", "<leader>hb", function()
  require("gitsigns").blame_line { full = true }
end, { desc = "Blame line" })
map("n", "<leader>htb", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle current line blame" })
map("n", "<leader>htd", function()
  require("gitsigns").toggle_deleted()
end, { desc = "Toggle deleted" })
map("n", "<leader>hs", function()
  require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
map("n", "<leader>hs", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
map("n", "<leader>hS", function()
  require("gitsigns").stage_buffer()
end, { desc = "Stage buffer" })
map("n", "<leader>hR", function()
  require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" })
map("n", "<leader>hu", function()
  require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" })
map("n", "<leader>hd", function()
  require("gitsigns").diffthis()
end, { desc = "Diff" })
map("n", "<leader>hD", function()
  require("gitsigns").diffthis "~"
end, { desc = "Diff HEAD" })
map("v", "<leader>hs", function()
  require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Stage hunk" })
map("v", "<leader>hr", function()
  require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Reset hunk" })
