require("oil").setup {
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  },
  win_options = {
    signcolumn = "yes:2",
  },
}

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil: Open parent directory" })
