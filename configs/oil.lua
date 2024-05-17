require("oil").setup {
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  },
}

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil: Open parent directory" })
