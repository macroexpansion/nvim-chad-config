require("mini.surround").setup {
  mappings = {
    add = "ma", -- Add surrounding in Normal and Visual modes
    delete = "md", -- Delete surrounding
    find = "mf", -- Find surrounding (to the right)
    find_left = "mF", -- Find surrounding (to the left)
    highlight = "mh", -- Highlight surrounding
    replace = "mr", -- Replace surrounding
    update_n_lines = "mn", -- Update `n_lines`

    suffix_last = "l", -- Suffix to search with "prev" method
    suffix_next = "n", -- Suffix to search with "next" method
  },
}
-- require('mini.pairs').setup()
require("mini.move").setup {
  mappings = {
    left = "<C-h>",
    right = "<C-l>",
    down = "<C-j>",
    up = "<C-k>",
  },
}
require("mini.comment").setup()
require("mini.basics").setup()
-- require 'mini.indentscope'.setup()
require("mini.trailspace").setup()
-- require('mini.tabline').setup()

require("mini.cursorword").setup()
vim.cmd "hi! link MiniCursorword Visual"
vim.cmd "hi! MiniCursorwordCurrent gui=nocombine guifg=NONE guibg=NONE"
